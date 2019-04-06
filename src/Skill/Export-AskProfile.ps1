#Requires -Version 3.0
#Requires -Modules AzureRM.KeyVault 

Param(
    [string] [Parameter(Mandatory=$true)] $VaultName
)

$CliConfigSecretName = "AskCli-Config"

$CliConfigBytes = [System.IO.File]::ReadAllBytes("$env:USERPROFILE\.ask\cli_config")
$CliConfigBase64 = [System.Convert]::ToBase64String($CliConfigBytes)
$CliConfigSecure = ConvertTo-SecureString -String $CliConfigBase64 -AsPlainText -Force
$CliConfigSecret = Set-AzureKeyVaultSecret -VaultName $VaultName -Name $CliConfigSecretName -SecretValue $CliConfigSecure
