Param(
    [string] [Parameter(Mandatory=$true)] $VaultName,   
    [string] [Parameter(Mandatory=$true)] $SkillId,
    [string] [Parameter(Mandatory)] [ValidateSet("skill", "isp", "model")] $Target,
    [switch] $Force
)

& "$PSScriptRoot\Import-AskProfile.ps1" -VaultName $VaultName

& ask deploy --target $Target $(if ($Force) { '--force' } else { '' })

& "$PSScriptRoot\Export-AskProfile.ps1" -VaultName $VaultName