[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $ProjectName = "SampleProject"
)

$testProject = "$ProjectName.Tests"

$version = dotnet --version
write-host $version
dotnet new console -n $ProjectName -o $ProjectName
dotnet new mstest -n $testProject -o $testProject
dotnet new sln -n $ProjectName

$projectPath = Join-Path -Path $ProjectName -ChildPath "$ProjectName.csproj"
$testProjectPath =  Join-Path -Path $testProject -ChildPath "$testProject.csproj"
$slnPath = "$ProjectName.sln"
dotnet sln $slnPath add $projectPath
dotnet sln $slnPath add $testProjectPath

dotnet add $testProjectPath reference $projectPath