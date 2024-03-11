function Get-DefaultBrowser {
	<#
	.SYNOPSIS
		Returns default browser for current user
	.DESCRIPTION
		Returns default browser for current user
	.PARAMETER (none)
	.EXAMPLE
		Get-DefaultBrowser
		Example return: "Edge"
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-DefaultBrowser.md
	#>
	[CmdletBinding()]
	param()
	try {
		if ($PSVersionTable.Platform -eq 'Unix') { throw "Not supported on Linux systems" }
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
	} catch {
		Write-Error "$($_.Exception.Message)"
	}
}
