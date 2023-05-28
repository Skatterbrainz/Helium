function Get-BadServices {
	<#
	.SYNOPSIS
		Get services which are configured to auto-start but are currently stopped
	.DESCRIPTION
		Get services which are configured to auto-start but are currently stopped
	.PARAMETER (none)
	.EXAMPLE
		Get-BadServices
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-BadServices.md
	#>
	[CmdletBinding()]
	param()
	Get-Service | Where-Object {$_.StartType -eq 'Automatic' -and $_.State -ne 'Running'}
}