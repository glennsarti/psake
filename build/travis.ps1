
$dotnetCLIChannel = 'Current'
$dotnetCLIRequiredVersion = 'latest'
$NoSudo = $false

. "$PSScriptRoot/tools.ps1"

$DotnetArguments = @{ Channel = $dotnetCLIChannel; Version = $dotnetCLIRequiredVersion; NoSudo = $NoSudo }
Install-Dotnet @DotnetArguments

# Add dotnet to PATH
$Env:PATH += "$([IO.Path]::PathSeparator)$Env:HOME/.dotnet"

# Execute once to configure
dotnet build -version -nologo

# Execute Build Tester
#. "$PSScriptRoot/../build.ps1"
#.\psake-buildTester.ps1