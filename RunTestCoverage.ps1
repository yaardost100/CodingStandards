
Write-Host "*********************************" 
Write-Host "****Unit Test Coverage Report****" 
Write-Host "*********************************" 

$tools = dotnet tool list -g
$reportgeneratorInstalled = $tools -like '*dotnet-reportgenerator-globaltool*'

if($reportgeneratorInstalled)
{
	$testProjects = Get-ChildItem -Filter *Tests*.csproj -Recurse
    $testProjects | % {
        $testProject = $_.Directory.FullName;
        dotnet test "$testProject"
    }
    reportgenerator "-reports:.\**\coverage.opencover.xml" "-targetdir:.\TestCoverageReport"
    & .\TestCoverageReport\index.htm
}
else
{
	Write-Host "Please install the report generator tool."
	Write-Host "dotnet tool install --global dotnet-reportgenerator-globaltool"
}