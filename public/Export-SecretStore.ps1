function Export-SecretStore {
	<#
	.SYNOPSIS
	Exports secrets from a specified secret vault.

	.DESCRIPTION
	This function retrieves secrets from a specified secret vault and exports them in a clear text format.

	.PARAMETER VaultName
	The name of the secret vault to export secrets from.

	.PARAMETER OutputFile
	The path to the output file where the exported secrets will be saved.

	.EXAMPLE
		Export-SecretStore -VaultName "MyVault" -OutputFile "C:\secrets.json"

		Exports secrets from the "MyVault" secret vault to the specified JSON file.
	
	.EXAMPLE
		Export-SecretStore -VaultName "MyVault"

		Exports secrets from the "MyVault" secret vault to the default output (console).

	.NOTES
		Requires Microsoft.PowerShell.SecretManagement module.
	
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Export-SecretStore.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$True)][string]$VaultName,
		[parameter(Mandatory=$false)][string]$OutputFile
	)

	if (!(Get-Module -Name Microsoft.PowerShell.SecretManagement)) {
		Write-Error "Microsoft.PowerShell.SecretManagement module is not installed."
		return
	}

	Write-Warning "This will export secrets in clear text from the vault: $vaultname - Do you wish to continue?"
	if (-not (Read-Host "Type 'yes' to continue") -eq 'yes') {
		Write-Host "Export cancelled."
		return
	}

	if (Get-SecretVault -Name $VaultName -ErrorAction SilentlyContinue) {
		Write-Verbose "Vault found: $VaultName"
	} else {
		Write-Error "Vault not found: $VaultName"
		break
	}
	Unlock-SecretVault -Name $VaultName

	[array]$secrets = Get-SecretInfo -Vault $VaultName

	$results = @()

	foreach ($secret in $secrets) {
		if ($secret.Type -eq 'String') {
			$value = Get-Secret -Name $secret.Name -Vault $VaultName -AsPlainText
			$results += ([pscustomobject]@{
				Name  = $secret.Name
				Type  = $secret.Type
				Value = $value
			})
		} else {
			# pscredential object > convert to username and password in clear text
			$value = Get-Secret -Name $secret.Name -Vault $VaultName
			$username = $value.UserName
			$password = $value.GetNetworkCredential().Password

			$results += ([pscustomobject]@{
				Name     = $secret.Name
				Type     = $secret.Type
				UserName = $username
				Password = $password
			})
		}
	}
	if (![string]::IsNullOrWhiteSpace($OutputFile)) {
		$results | ConvertTo-Json | Out-File -FilePath $OutputFile -Encoding utf8
	} else {
		$results | ConvertTo-Json
	}
}