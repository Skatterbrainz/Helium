function Test-IsAdmin {
	<#
	.SYNOPSIS
		Returns True if session running in elevated context
	.DESCRIPTION
		Returns True if session running in elevated context, such as Administrator (Windows) or root (Linux)
	.EXAMPLE
		if (Test-IsAdmin) { ... }
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Test-IsAdmin.md
	#>
	param()
	if ($PSVersionTable.Platform -eq 'Unix') {
		return $((id -u) -eq 0)
	} else {
		return $((New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator))
	}
}