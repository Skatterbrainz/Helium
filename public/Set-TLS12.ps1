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
		if ($PSVersionTable.Platform -eq 'Unix') { throw "Not supported on Linux systems" }
		[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
		[Net.ServicePointManager]::SecurityProtocol
	} catch {
		Write-Error $_.Exception.Message
	}
}