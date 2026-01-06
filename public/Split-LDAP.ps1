function Split-LDAP {
	<#
	.SYNOPSIS
		Split LDAP path string
	.DESCRIPTION
		Split LDAP path string like Split-Path, to return the root path of
		and LDAP object DistinguishedName, or the Domain suffix portion.
	.PARAMETER Path
		The LDAP object DistinguishedName
	.PARAMETER Delimiter
		The character to apply the split upon. The defaul is a comma (,)
	.PARAMETER Part
		* Parent = return the root path portion
		* Domain = return the domain suffix portion
	.EXAMPLE
		$p1 = "CN=JSmith,CN=Users,DC=east,DC=contoso,DC=local"
		Split-LDAP $p1
		Returns "CN-Users,DC=east,DC=contoso,DC=local"
	.EXAMPLE
		$p1 = "CN=JSmith,CN=Users,DC=east,DC=contoso,DC=local"
		Split-LDAP $p1 -Part Domain
		Returns "DC=east,DC=contoso,DC=local"
	.EXAMPLE
		"CN=JSmith,CN=Users,DC=east,DC=contoso,DC=local" | Split-LDAP
		Applies the split using pipeline input to return:
		"CN=Users,DC=east,DC=contoso,DC=local"
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Split-LDAP.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$True,ValueFromPipeline=$True)][string]$Path,
		[parameter(Mandatory=$false)][string]$Delimiter = ",",
		[parameter(Mandatory=$false)][string][ValidateSet('Parent','Domain')]$Part = 'Parent'
	)
	$items = $Path -split $Delimiter
	if ($Part -eq 'Parent') {
		$items[1..100] -join $Delimiter
	} else {
		$($items | Where-Object {$_ -like "DC*"}) -join $Delimiter
	}
}