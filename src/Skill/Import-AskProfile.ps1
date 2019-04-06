#Requires -Version 3.0
#Requires -Modules AzureRM.KeyVault  

Param(
    [string] [Parameter(Mandatory=$true)] $VaultName
)

$CliConfigSecretName = "AskCli-Config"

$CliConfigSecret = Get-AzureKeyVaultSecret -VaultName $VaultName -Name $CliConfigSecretName
if (!$CliConfigSecret) { throw "Secret not found: $CliConfigSecretName" }
$CliConfigBytes = [System.Convert]::FromBase64String($CliConfigSecret.SecretValueText)
[System.IO.File]::WriteAllBytes("$env:USERPROFILE\.ask\cli_config", $CliConfigBytes)

