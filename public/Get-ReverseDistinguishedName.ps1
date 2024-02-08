function Get-ReverseDistinguishedName {
	<#
	.SYNOPSIS
		Reverse an LDAP DistinguishedName into ADSI form
	.DESCRIPTION
		Reverse an LDAP DistinguishedName value into ADSI form so that it 
		reads left-to-right Domain,Path,Name without the prefix keys (e.g. "OU=")
	.PARAMETER DistinguishedName
		LDAP DistinguishedName value
	.PARAMETER PathOnly
		Optional. Returns domain root and path without the object name (CN= value)
	.EXAMPLE
		Get-ReverseDistinguishedName "CN=TaylorS,OU=Users,OU=Sales,OU=CORP,DC=East,DC=Contoso,DC=local"
		Returns: "East.Contoso.local\CORP\Sales\UsersTaylorS"
	.EXAMPLE
		Get-ReverseDistinguishedName -PathOnly "CN=TaylorS,OU=Users,OU=Sales,OU=CORP,DC=East,DC=Contoso,DC=local"
		Returns: "East.Contoso.local\CORP\Sales"
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ReverseDistinguishedName.md
	#>
	param (
		[parameter(Mandatory=$True,HelpMessage="LDAP DistinguishedName")]
		[string][ValidateNotNullOrEmpty()]$DistinguishedName,
		[parameter()][switch]$PathOnly
	)
	$parts = $DistinguishedName -split ','
	$base = $parts | Where-Object {$_.StartsWith('DC=')} | Foreach-Object {$_ -replace 'DC=',''}
	$name = $parts | Where-Object {$_.StartsWith('CN=')} | Foreach-Object {$_ -replace 'CN=',''}
	$path = $parts | Where-Object {$_.StartsWith('OU=')} | Foreach-Object {$_ -replace 'OU=',''}
	if ($base) { $base = $base -join '.' }
	if ($path) { [array]::Reverse($path); $path = $path -join '\' }
	$result = "$($base)\$($path)"
	if (!$PathOnly) {
		$result += "$($name)"
	}
	return $result
}