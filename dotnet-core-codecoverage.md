# Code Coverage and Sonar Code Analzyer

## Add Code Coverage and Sonar Code Analzyer

Anytime new project(s) is/are added to a repo the following script should be run.
*NOTE:* This only applies to .Net Core projects.

### Pre-Requisites

Copy the following files the the root of the repo.

1. scripts/AddCoverlet.ps1
2. scripts/AddSonar.ps1
3. scripts/innRoad.ruleset
4. scripts/RunTestCoverage.ps1
5. .editorconfig
6. .gitignore

### How Enable Code Coverage on .Net Core Projects
1. Make sure the Visual Studio solution is closed.
2. Open a powershell console with the path local the repo directory.
2. Run **AddCoverlet.ps1**
3. Run **AddSonar.ps1**
4. Run **RunTestCoverage.ps1**
    1. If this is the first time you're running this script you may need to install the report generator tool.
    2. Execute the command: dotnet tool install --global dotnet-reportgenerator-globaltool
    3. Run **RunTestCoverage.ps1** again after installing the tool.
5. Upon successful unit tests execution, a browser window will open with the unit test coverage results.

### Verify Unit Test Code Coverage (Always do this.)
As part of your development effort, you will be writing and updating unit tests. 
The code coverage tool is here to help you ensure all executions paths of the code have been addressed via Unit Tests.

1. To ensure proper code coverage is met, run the **RunTestCoverage.ps1** from the powershell console.
2. Upon completion you will receive a code coverage report. 
3. Navigate the report to ensure the functionality you've written or update is covered.
