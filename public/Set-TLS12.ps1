function Set-TLS12 {
	<#
	.SYNOPSIS
		Sets TLS channel to v1.2 for the active/current session only
	.DESCRIPTION
		Sets TLS channel to v1.2 for the active/current session only
	.PARAMETER (none)
	.EXAMPLE
		Set-TLS12
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Set-TLS12.md
	#>
	try {
		if ($PSVersionTable.Platform -eq 'Unix') { throw "This command only works on Windows" }
		[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
		[Net.ServicePointManager]::SecurityProtocol
	} catch {
		Write-Error $_.Exception.Message
	}
}