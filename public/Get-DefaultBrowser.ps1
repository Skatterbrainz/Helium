function Get-DefaultBrowser {
	<#
	.SYNOPSIS
		Returns default browser for current user
	.DESCRIPTION
		Returns default browser for current user
	.PARAMETER (none)
	.EXAMPLE
		Get-DefaultBrowser
		Example return: "Chrome" (on Windows)
		Example return: "com.google.Chrome.desktop" (on Linux)
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-DefaultBrowser.md
	#>
	[CmdletBinding()]
	param()
	try {
		if ($PSVersionTable.Platform -ne 'Unix') {
			$progid = Get-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice\' -ErrorAction Stop | Select-Object -ExpandProperty 'ProgId'
			if ($progid -eq 'MSEdgeHTM') {
				'Edge'
			} elseif ($progid -like 'BraveHTML*') {
				'Brave'
			} elseif ($progid -like 'ChromeHTML*') {
				'Chrome'
			} elseif ($progid -like 'FirefoxURL*') {
				'Firefox'
			}
		} else {
			Get-Content -Path "$HOME/.config/mimeapps.list" | Select-String -Pattern 'x-scheme-handler/https=' -ErrorAction Stop | ForEach-Object {
				$_.Line.Split('=')[1]
			}
		}
	} catch {
		Write-Error "$($_.Exception.Message)"
	}
}
