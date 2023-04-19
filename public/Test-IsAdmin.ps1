function Test-IsAdmin {
	<#
	.SYNOPSIS
		Returns True if session running in Administrator context
	.DESCRIPTION
		Returns True if session running in Administrator context
	.EXAMPLE
		if (Test-IsAdmin) { ... }
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Test-IsAdmin.md
	#>
	param()
	return (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}