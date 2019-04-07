Param(
    [string] [Parameter(Mandatory=$true)] $VaultName,   
    [string] [Parameter(Mandatory=$true)] $SkillId,
    [switch] $Force
)

Set-Location $PSScriptRoot

.\Import-AskProfile.ps1 -VaultName $VaultName

& npm install -g ask-cli
& ask deploy --target skill $(if ($Force) { '--force' } else { '' })
& ask deploy --target model $(if ($Force) { '--force' } else { '' })

.\Export-AskProfile.ps1 -VaultName $VaultName
