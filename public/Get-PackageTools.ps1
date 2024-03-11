function Get-PackageTools {
	<#
	.SYNOPSIS
		Get Package deployment clients
	.DESCRIPTION
		Returns install state of various package deployment clients like
		Chocolatey and WinGet. Others can be added (let me know!)
	.PARAMETER (none)
	.EXAMPLE
		Get-PackageTools
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-PackageTools.md
	#>
	[CmdletBinding()]
	param()
	if ($PSVersionTable.Platform -eq 'Unix') { throw "No supported on Linux systems" }
	try { $winget = winget } catch {}
	$choc = $env:ChocolateyInstall
	[pscustomobject]@{
		Chocolatey = $($null -ne $choc)
		WinGet     = $($null -ne $winget)
	}
}