function Get-Browsers {
	<#
	.SYNOPSIS
		Returns a list of installed browsers and related properties.
	.DESCRIPTION
		Returns a list of installed browsers and related properties, including product name, vendor, version, install type, and number of profiles.
	.EXAMPLE
		Get-Browsers
		Returns a list of installed browsers and their properties.
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-Browsers.md
	#>
	[CmdletBinding()]
	param()
	if ($IsLinux) {
		if (Test-Path -Path '~/.var/app/com.microsoft.Edge/config/microsoft-edge') {
			$profiles = Get-BrowserProfile -Browser 'Edge'
			[pscustomobject]@{
				ProductName  = 'Edge'
				Vendor	     = 'Microsoft'
				Version      = (Get-Item -Path '~/.var/app/com.microsoft.Edge/config/microsoft-edge/msedge').VersionInfo.ProductVersion
				InstallType  = 'Flatpak'
				Profiles     = $profiles.Count
			}
		}
		if (Test-Path -Path '~/.var/app/com.google.Chrome/config/google-chrome') {
			$profiles = Get-BrowserProfile -Browser 'Chrome'
			[pscustomobject]@{
				ProductName  = 'Chrome'
				Vendor	     = 'Google'
				Version      = (Get-Item -Path '~/.var/app/com.google.Chrome/config/google-chrome/google-chrome').VersionInfo.ProductVersion
				InstallType  = 'Flatpak'
				Profiles     = $profiles.Count
			}
		}
		if (Test-Path -Path '~/.var/app/org.mozilla.firefox/config/firefox') {
			$profiles = Get-BrowserProfile -Browser 'Firefox'
			[pscustomobject]@{
				ProductName  = 'Firefox'
				Vendor	     = 'Mozilla'
				Version      = (Get-Item -Path '~/.var/app/org.mozilla.firefox/config/firefox/firefox').VersionInfo.ProductVersion
				InstallType  = 'Flatpak'
				Profiles     = $profiles.Count
			}
		}
		if (Test-Path -Path '/var/lib/flatpak/app/com.brave.Browser/current/active/files/brave') {
			$json = Get-Content -Path '/var/lib/flatpak/app/com.brave.Browser/current/active/files/manifest.json' -Raw | ConvertFrom-Json
			$profiles = Get-BrowserProfile -Browser 'Brave'
			[pscustomobject]@{
				ProductName  = 'Brave'
				Vendor	     = 'Brave Software'
				Version      = (Get-Item -Path '/var/lib/flatpak/app/com.brave.Browser/current/active/files/brave').VersionInfo.ProductVersion
				InstallType  = 'Flatpak'
				Profiles     = $profiles.Count
			}
		}
		if (Test-Path -Path '~/.var/app/org.chromium.Chromium/config/chromium') {
			$profiles = Get-BrowserProfile -Browser 'Chromium'
			[pscustomobject]@{
				ProductName  = 'Chromium'
				Vendor	     = 'Google'
				Version      = (Get-Item -Path '~/.var/app/org.chromium.Chromium/config/chromium/chromium').VersionInfo.ProductVersion
				InstallType  = 'Flatpak'
				Profiles     = $profiles.Count
			}
		}
	} else {
		if (Test-Path -Path "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe") {
			$profiles = Get-BrowserProfile -Browser 'Edge'
			[pscustomobject]@{
				ProductName  = 'Edge'
				Vendor	     = 'Microsoft'
				Version      = (Get-Item -Path "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe").VersionInfo.ProductVersion
				InstallType  = 'System'
				Profiles     = $profiles.Count
			}
		}
		if (Test-Path -Path "$env:PROGRAMFILES\Google\Chrome\Application\chrome.exe") {
			$profiles = Get-BrowserProfile -Browser 'Chrome'
			[pscustomobject]@{
				ProductName  = 'Chrome'
				Vendor	     = 'Google'
				Version      = (Get-Item -Path "$env:PROGRAMFILES\Google\Chrome\Application\chrome.exe").VersionInfo.ProductVersion
				InstallType  = 'System'
				Profiles     = $profiles.Count
			}
		}
		if (Test-Path -Path "$env:PROGRAMFILES\Mozilla Firefox\firefox.exe") {
			$profiles = Get-BrowserProfile -Browser 'Firefox'
			[pscustomobject]@{
				ProductName    = 'Firefox'
				Vendor         = 'Mozilla'
				Version        = (Get-Item -Path "$env:PROGRAMFILES\Mozilla Firefox\firefox.exe").VersionInfo.ProductVersion
				InstallType    = 'System'
				Profiles       = $profiles.Count
			}
		}
		if (Test-Path -Path "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\Application\brave.exe") {
			$profiles = Get-BrowserProfile -Browser 'Brave'
			[pscustomobject]@{
				ProductName   = 'Brave'
				Vendor        = 'Brave Software'
				Version       = (Get-Item -Path "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\Application\brave.exe").VersionInfo.ProductVersion
				InstallType   = 'User'
				Profiles      = $profiles.Count
			}
		}
	}
}