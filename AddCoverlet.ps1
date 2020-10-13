$testProjects = Get-ChildItem -Filter *Tests.csproj -Recurse
	
$testProjects | foreach { 
	try
	{
		$path = $_.FullName;

		$proj = [xml](Get-Content $path);
		
		$targetFramework = $proj.Project.PropertyGroup  | where { -not [String]::IsNullOrWhiteSpace($_.TargetFramework) };

		$shouldSave = $false
		if($targetFramework.CollectCoverage -eq $null)
		{
			$CollectCoverage = $targetFramework.ParentNode.ParentNode.CreateElement('CollectCoverage');
            $targetFramework.AppendChild($CollectCoverage) | out-null;
			$targetFramework.CollectCoverage = "true";
			$shouldSave = $true
		}
		
		if($targetFramework.CoverletOutputFormat -eq $null)
		{
			$CoverletOutputFormat = $targetFramework.ParentNode.ParentNode.CreateElement('CoverletOutputFormat');
            $targetFramework.AppendChild($CoverletOutputFormat) | out-null;
			$targetFramework.CoverletOutputFormat = "opencover";
			$shouldSave = $true
		}
		
		if($targetFramework.Exclude -eq $null)
		{
			$Exclude = $targetFramework.ParentNode.ParentNode.CreateElement('Exclude');
            $targetFramework.AppendChild($Exclude) | out-null;
			$targetFramework.Exclude = "[xunit.*]*";
			$shouldSave = $true
		}
				
		$PackageReference = $proj.Project.ItemGroup | where {$_.PackageReference -ne $null}
		$alreadyExists = $PackageReference.ChildNodes | where {$_.Include -eq "coverlet.msbuild"}
		
		if($alreadyExists -eq $null)
		{
			$coverletElement = $PackageReference.ParentNode.ParentNode.CreateElement('PackageReference');
			$PackageReference.ChildNodes[0].ParentNode.AppendChild($coverletElement) | out-null;
			$coverletElement.SetAttribute('Include',"coverlet.msbuild");
			$coverletElement.SetAttribute('Version',"2.9.0");
			
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
			Write-Host "Coverlet added to $path"
		}
	}
     catch
     {
        Write-Host $path ([System.Environment]::NewLine)
        $_
     }
}
