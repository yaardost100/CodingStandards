$testProjects = Get-ChildItem -Filter *.csproj -Recurse
$ruleSetPath = Join-Path $PSScriptRoot CleanCode.ruleset
	
$testProjects | foreach { 
	try
	{
		$path = $_.FullName;
		
		$proj = [xml](Get-Content $path);
		
		$targetFramework = $proj.Project.PropertyGroup  | where { -not [String]::IsNullOrWhiteSpace($_.TargetFramework) };

		$shouldSave = $false
		if($targetFramework.CodeAnalysisRuleSet -eq $null)
		{
			$relativeRuleSetPath = [System.Uri]::new($path).MakeRelative([System.Uri]::new($ruleSetPath));
			$CodeAnalysisRuleSet = $targetFramework.ParentNode.ParentNode.CreateElement('CodeAnalysisRuleSet');
            $targetFramework.AppendChild($CodeAnalysisRuleSet) | out-null;
			$targetFramework.CodeAnalysisRuleSet = $relativeRuleSetPath;
			$shouldSave = $true
		}
		
		$PackageReference = $proj.Project.ItemGroup | where {$_.PackageReference -ne $null}
		
		if($PackageReference -eq $null)
		{
			$itemGroup = $proj.CreateElement('ItemGroup');
			$proj.Project.AppendChild($itemGroup) | out-null;
			$PackageReference = @($itemGroup;)
		}
		
		$alreadyExists = $PackageReference.ChildNodes | where {$_.Include -eq "SonarAnalyzer.CSharp"}
		
		if($alreadyExists -eq $null)
		{
			$coverletElement = $PackageReference.ParentNode.ParentNode.CreateElement('PackageReference');
			$PackageReference.AppendChild($coverletElement) | out-null;
			$coverletElement.SetAttribute('Include',"SonarAnalyzer.CSharp");
			$coverletElement.SetAttribute('Version',"8.13.1.21947");
			
			$PrivateAssets = $PackageReference.ParentNode.ParentNode.CreateElement('PrivateAssets');
			$coverletElement.AppendChild($PrivateAssets) | out-null;
			$coverletElement.PrivateAssets = "all"
			
			$IncludeAssets = $PackageReference.ParentNode.ParentNode.CreateElement('IncludeAssets');
			$coverletElement.AppendChild($IncludeAssets) | out-null;
			$coverletElement.IncludeAssets = "runtime; build; native; contentfiles; analyzers"
			$shouldSave = $true		
		}
		
		if($shouldSave)
		{
			$proj.Save($path);
			Write-Host "SonarAnalyzer added to $path"
		}
	}
     catch
     {
        Write-Host $path ([System.Environment]::NewLine)
        $_
     }
}
