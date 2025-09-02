function Import-SecretStore {
	<#
	.SYNOPSIS
	Imports secrets from a JSON file into a specified secret vault.

	.DESCRIPTION
	This function reads a JSON file containing secrets and imports them into a specified secret vault.
	If the vault does not exist, it will be created. Existing secrets can be overwritten if the -Force
	parameter is specified.

	.PARAMETER Path
	The path to the JSON file containing the secrets.

	.PARAMETER VaultName
	The name of the secret vault to import the secrets into.

	.PARAMETER Force
	Forces the overwriting of existing secrets in the vault.

	.EXAMPLE
		Import-SecretStore -Path "C:\secrets.json" -VaultName "MyVault"

		Imports secrets from the specified JSON file into the "MyVault" secret vault.
	
	.EXAMPLE
		Import-SecretStore -Path "C:\secrets.json" -VaultName "MyVault" -Force

		Forces the overwriting of existing secrets in the "MyVault" secret vault.
	
	.NOTES
		Requires the Microsoft.PowerShell.SecretManagement and Microsoft.PowerShell.SecretStore modules.
	
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Import-SecretStore.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$True)][string]$Path,
		[parameter(Mandatory=$True)][string]$VaultName,
		[parameter(Mandatory=$False)][switch]$Force
	)
	if (!(Get-Module -Name Microsoft.PowerShell.SecretManagement)) {
		Write-Error "Microsoft.PowerShell.SecretManagement module is not installed."
		return
	}
	if (!(Test-Path -Path $Path)) {
		Write-Error "File not found: $Path"
		return
	}

	$json = Get-Content -Path $Path -Raw | ConvertFrom-Json
	if (!(Get-SecretVault -Name $VaultName -ErrorAction SilentlyContinue)) {
		Write-Host "Creating new secret vault: $VaultName"
		New-SecretVault -Name $VaultName -ErrorAction Stop
	} else {
		Write-Warning "Secret vault already exists: $VaultName"
	}

	foreach ($secret in $json) {
		if ($secret.Type -eq 2 -or $secret.Type -eq 'String') {
			if (Get-Secret -name $secret.Name -Vault $VaultName -ErrorAction SilentlyContinue) {
				if ($Force.IsPresent) {
					Write-Warning "Overwriting existing secret: $($secret.Name)"
					Remove-Secret -Name $secret.Name -Vault $VaultName -Force
					Set-Secret -Name $secret.Name -Vault $VaultName -SecureStringSecret ($secret.Value | ConvertTo-SecureString -AsPlainText -Force)
				} else {
					Write-Warning "Secret already exists and will not be overwritten: $($secret.Name)"
					continue
				}
			} else {
				Write-Host "Creating new secret: $($secret.Name)"
				Set-Secret -Name $secret.Name -Vault $VaultName -SecureStringSecret ($secret.Value | ConvertTo-SecureString -AsPlainText -Force)
			}
		} else {
			# pscredential object > convert to username and password
			if (Get-Secret -Name $secret.Name -Vault $VaultName -ErrorAction SilentlyContinue) {
				if ($Force.IsPresent) {
					Write-Warning "Overwriting existing secret: $($secret.Name)"
					Remove-Secret -Name $secret.Name -Vault $VaultName -Force
					$credential = New-Object System.Management.Automation.PSCredential($secret.UserName, (ConvertTo-SecureString -String $secret.Password -AsPlainText -Force))
					Set-Secret -Name $secret.Name -Vault $VaultName -Secret $credential
				} else {
					Write-Warning "Secret already exists and will not be overwritten: $($secret.Name)"
				}
			} else {
				Write-Host "Creating new secret: $($secret.Name)"
				$credential = New-Object System.Management.Automation.PSCredential($secret.UserName, (ConvertTo-SecureString -String $secret.Password -AsPlainText -Force))
				Set-Secret -Name $secret.Name -Vault $VaultName -Secret $credential
			}
		}
	}
}