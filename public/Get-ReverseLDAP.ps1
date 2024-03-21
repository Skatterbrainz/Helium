<#
.SYNOPSIS
	Reverse LDAP path string to Domain\OU format
.DESCRIPTION
	Reverse LDAP distinguishedName format order to result in a Domain\OU ordered
	string value.
.PARAMETER Path
	LDAP path or DistinguishedName
.PARAMETER RelativePath
	Optional. If present, excludes the DC portions of the path string. See Example 2
.EXAMPLE
	Get-ReverseLDAP -Path "CN=SmithJ,OU=Users,OU=Sales,OU=Departments,OU=CORP,DC=contoso,DC=local"

	Returns: contoso.local\CORP\Departments\Sales\Users\SmithJ
.EXAMPLE
	Get-ReverseLDAP -Path "CN=SmithJ,OU=Users,OU=Sales,OU=Departments,OU=CORP,DC=contoso,DC=local" -RelativePath

	Returns: CORP\Departments\Sales\Users\SmithJ
.LINK
	https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ReverseLDAP.md
#>
function Get-ReverseLDAP {
	param (
		[parameter(Mandatory=$True,HelpMessage="DistinguishedName value")][string]$Path,
		[parameter(Mandatory=$False,HelpMessage="Do not include the DC portion")][switch]$RelativePath
	)
	try {
		if ([string]::IsNullOrWhiteSpace($Path)) { throw "Null value" }
		$parts = @()
		if (!$RelativePath.IsPresent) {
			$domparts = $(Split-LDAP $Path -Part Domain).Split(",") | Foreach-Object {
				$_ -replace "DC=",""
			}
			$domparts = $domparts -join "."
			$parts += $domparts
		}
		$ouparts = $Path.Split(",") | Foreach-Object {
			if ($_.StartsWith("OU=")) {
				$_.Replace('OU=','')
			}
		}
		[array]::Reverse($ouparts)
		$parts += $ouparts
		$cnpart = $Path.Split(",") | Where-Object {$_.StartsWith("CN=")}
		if ($cnpart) {
			$parts += $cnpart.Replace("CN=","")
		}
		$parts -join '\'
	} catch {
		$msg = $_.Exception.Message
		if ($msg -ne 'Null value') {
			Write-Error $msg
		}
	}
}