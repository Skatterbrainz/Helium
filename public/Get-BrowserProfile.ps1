function Get-BrowserProfile {
	<#
	.SYNOPSIS
		Query Browser Profiles
	.DESCRIPTION
		Query Browser profiles, returning ID, Name and UserName. For current user or all users
	.PARAMETER Browser
		Optional. Browser app to target for query (if installed)
		* Chrome
		* Edge
		* Brave
		* Firefox
	.EXAMPLE
		Get-BrowserProfile -Browser Edge

		Returns all profiles for the Edge browser
	.EXAMPLE
		Get-BrowserProfile -Browser Chrome

		Returns all profiles for the Chrome browser
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-BrowserProfile.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$True)][string][ValidateSet('Chrome','Edge','Brave','Firefox')]$Browser
	)
	switch ($Browser) {
		'Chrome' {
			if ($IsLinux) {
				$rootpath = '~/.var/app/com.google.Chrome/config/google-chrome'
				if (Test-Path -Path $rootpath) {
					$installType = 'Flatpak'
				} elseif (Test-Path -Path '~/.config/google-chrome') {
					$installType = 'System'
					$rootpath    = '~/.config/google-chrome'
				} else {
					throw "Chrome Browser not installed"
				}
				$profpath = "$rootpath/Local State"
				if (!(Test-Path $profpath)) { throw "File not found: $profpath" }
				$profileData = Get-Content $profpath| ConvertFrom-Json
				$buildinfo   = Get-Content '~/.var/app/com.google.Chrome/config/google-chrome/Last Version'
				$profiles    = $profileData.profile.info_cache.psobject.Properties.Name
				foreach ($profile in $profiles) {
					$pname = $profileData.profile.info_cache."$profile".name
					[pscustomobject]@{
						ProfileID    = $profile
						Path         = Join-Path $rootpath $profile
						Name         = $pname
						Browser      = $Browser
						Version      = $buildinfo
						InstallType  = $installType
						ComputerName = $(hostname)
						UserName     = $($env:USER)
					}
				}
			} else {
				$rootpath = "$env:LOCALAPPDATA\Google\Chrome\User Data"
				$profiles = Get-ChildItem -Path "HKCU:\Software\Google\Chrome\PreferenceMACs"
				if (Test-Path "$env:PROGRAMFILES\Google\Chrome\Application\chrome.exe") {
					$buildinfo = (Get-Item "$env:PROGRAMFILES\Google\Chrome\Application\chrome.exe").VersionInfo.ProductVersion
				} else {
					$buildinfo = "notfound"
				}
				foreach ($profile in $profiles) {
					$profileName = $profile.PSChildName
					$profilePath = Join-Path $rootpath $profile.PSChildName
					[pscustomobject]@{
						ProfileID    = $profile.PSChildName
						Path         = $profilePath
						Name         = $profileName
						Browser      = $Browser
						Version      = $buildinfo
						InstallType  = 'System'
						ComputerName = $($env:COMPUTERNAME)
						UserName     = $($env:USERNAME)
					}
				}
			}
		}
		'Edge' {
			if ($IsLinux) {
				$rootpath = '~/.var/app/com.microsoft.Edge/config/microsoft-edge'
				if (Test-Path -Path $rootpath) {
					$installType = 'Flatpak'
				} elseif (Test-Path -Path '~/.config/microsoft-edge') {
					$installType = 'Snap'
					$rootpath    = '~/.config/microsoft-edge'
				} else {
					throw "Edge Browser not installed"
				}
				$profpath = "$rootpath/Local State"
				if (!(Test-Path $profpath)) { throw "File not found: $profpath" }
				$profileData = Get-Content $profpath | ConvertFrom-Json
				$buildinfo   = Get-Content '~/.var/app/com.microsoft.Edge/config/microsoft-edge/Last Version'
				$profiles    = $profileData.profile.info_cache.psobject.Properties.Name
				foreach ($profile in $profiles) {
					$pname = $profileData.profile.info_cache."$profile".name
					[pscustomobject]@{
						ProfileID    = $profile
						Path         = Join-Path $rootpath $profile
						Name         = $pname
						Browser      = $Browser
						Version      = $buildinfo
						InstallType  = $installType
						ComputerName = $(hostname)
						UserName     = $($env:USER)
					}
				}
			} else {
				$rootpath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data"
				$profiles = Get-ChildItem -Path "HKCU:\Software\Microsoft\Edge\Profiles"
				if (Test-Path "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe") {
					$buildinfo = (Get-Item "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe").VersionInfo.ProductVersion
				} else {
					$buildinfo = "notfound"
				}
				foreach ($profile in $profiles) {
					$profileName = $profile.PSChildName
					$profilePath = Join-Path $rootpath $profile.PSChildName
					[pscustomobject]@{
						ProfileID    = $profile.PSChildName
						Path         = $profilePath
						Name         = $profileName
						Browser      = $Browser
						Version      = $buildinfo
						ComputerName = $($env:COMPUTERNAME)
						UserName     = $($env:USERNAME)
					}
				}
			}
		}
		'Brave' {
			if ($IsLinux) {
				# Flatpak default path
				$rootpath = '~/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser'
				if (Test-Path -Path $rootpath) {
					$installType = 'Flatpak'
				} elseif (Test-Path -Path '~/.config/BraveSoftware/Brave-Browser') {
					$installType = 'System'
					$rootpath    = '~/.config/BraveSoftware/Brave-Browser'
				} else {
					throw "Brave Browser not installed"
				}
				$profpath = "$rootpath/Local State"
				if (!(Test-Path $profpath)) { throw "File not found: $profpath" }
				$profileData = Get-Content $profpath| ConvertFrom-Json
				$buildinfo   = Get-Content (Join-Path $rootpath 'Last Version')
				$profiles    = $profileData.profile.info_cache.psobject.Properties.Name
				foreach ($profile in $profiles) {
					$pname = $profileData.profile.info_cache."$profile".name
					[pscustomobject]@{
						ProfileID    = $profile
						Path         = Join-Path $rootpath $profile
						Name         = $pname
						Browser      = $Browser
						Version      = $buildinfo
						InstallType  = $installType
						ComputerName = $(hostname)
						UserName     = $($env:USER)
					}
				}
			} else {
				$rootpath = "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data"
				# NEED TO REDO THIS SECTION
			}
		}
		'Firefox' {
			if ($IsLinux) {
				$rootpath = '~/.mozilla/firefox'
				if (Test-Path -Path $rootpath) {
					$installType = 'System'
				} elseif (Test-Path -Path '~/.var/app/org.mozilla.firefox/config') {
					$installType = 'Flatpak'
					$rootpath    = '~/.var/app/org.mozilla.firefox/config'
				} else {
					throw "Firefox Browser not installed"
				}
				$profpath = Join-Path $rootpath "profiles.ini"
				if (!(Test-Path $profpath)) { throw "File not found: $profpath" }
				$profileData    = Get-IniContent -FilePath $profpath -IgnoreComments
				$profiles       = $profileData.Keys | Where-Object { $_ -match 'Profile\d' }
				$defaultProfile = $profileData.Item('Profile0')['Path']
				$defPath        = Join-Path $rootpath $defaultProfile
				$compFile       = Join-Path $defPath 'compatibility.ini'
				$buildinfo      = $((Get-IniContent -FilePath $compFile -IgnoreComments)['Compatibility']['LastVersion'] -Split "_")[0]
				foreach ($profile in $profiles) {
					$pname = $profileData.Item($profile)['Name']
					$ppath = $profileData.Item($profile)['Path']
					[pscustomobject]@{
						ProfileID    = $profile
						Path         = Join-Path $rootpath $ppath
						Name         = $pname
						Browser      = $Browser
						Version      = $buildinfo
						InstallType  = $installType
						ComputerName = $(hostname)
						UserName     = $($env:USER)
					}
				}
			} else {
				$rootpath = "$env:APPDATA\Mozilla\Firefox"
				if (Test-Path -Path $rootpath) {
					$installType = 'System'
				} else {
					throw "Firefox Browser not installed"
				}
				$profpath   = Join-Path $rootpath "profiles.ini"
				$buildinfo  = Get-ItemPropertyValue -Path "HKLM:\SOFTWARE\Mozilla\Mozilla Firefox" -Name CurrentVersion
				$profileIDs = $(Import-Ini -Path $profpath -IgnoreComments).Keys | Where-Object { $_ -match 'Profile\d' }
				$profiles = Import-Ini -Path $profpath -IgnoreComments
				foreach ($profile in $profileIDs) {
					$pdata = $profiles.Item($profile)
					$pname = $pdata['Name']
					$ppath = $pdata['Path']
					[pscustomobject]@{
						ProfileID    = $profile
						Path         = Join-Path $rootpath "Profiles\$ppath"
						Name         = $pname
						Browser      = $Browser
						Version      = $buildinfo
						InstallType  = $installType
						ComputerName = $($env:COMPUTERNAME)
						UserName     = $($env:USERNAME)
					}
				}
			}
		}
	}
}
