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
				if (!(Get-Browser | Where-Object { $_.ProductName -eq 'Chrome' })) {
					Write-Output "Chrome Browser not installed"
					return
				}
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
				foreach ($profileItem in $profiles) {
					$profileName = $profileData.profile.info_cache."$profileItem".name
					[pscustomobject]@{
						ProfileID    = $profileItem
						Path         = Join-Path $rootpath $profileItem
						CommandLine  = "google-chrome --profile-directory=`"$($profileItem.PSChildName)`""
						Name         = $profileName
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
				foreach ($profileItem in $profiles) {
					$profileName = $profileItem.PSChildName
					$profilePath = Join-Path $rootpath $profileItem.PSChildName
					[pscustomobject]@{
						ProfileID    = $profileItem.PSChildName
						Path         = $profilePath
						CommandLine  = "google-chrome --profile-directory=`"$($profileItem.PSChildName)`""
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
				if (Test-Path -Path '~/.var/app/com.microsoft.Edge/config/microsoft-edge/Last Version') {
					$buildinfo = Get-Content '~/.var/app/com.microsoft.Edge/config/microsoft-edge/Last Version'
				} else {
					$buildinfo = "notfound"
				}
				$profiles = $profileData.profile.info_cache.psobject.Properties.Name
				foreach ($profileItem in $profiles) {
					$profileName = $profileData.profile.info_cache."$profileItem".name
					[pscustomobject]@{
						ProfileID    = $profileItem
						Path         = Join-Path $rootpath $profileItem
						CommandLine  = "microsoft-edge --profile-directory=`"$profileItem`""
						Name         = $profileName
						Browser      = $Browser
						Version      = $buildinfo
						InstallType  = $installType
						ComputerName = $(hostname)
						UserName     = $($env:USER)
					}
				}
			} else {
				$rootpath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data"
				if (Test-Path -Path "HKCU:\Software\Microsoft\Edge\Profiles") {
					$profiles = Get-ChildItem -Path "HKCU:\Software\Microsoft\Edge\Profiles"
				} else {
					throw "Edge Browser profiles not found in registry"
				}
				if (Test-Path "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe") {
					$buildinfo = (Get-Item "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe").VersionInfo.ProductVersion
				} else {
					$buildinfo = "notfound"
				}
				foreach ($profileItem in $profiles) {
					$profileName = $profileItem.PSChildName
					$profilePath = Join-Path $rootpath $profileItem.PSChildName
					[pscustomobject]@{
						ProfileID    = $profileItem.PSChildName
						Path         = $profilePath
						CommandLine  = "microsoft-edge --profile-directory=`"$($profileItem.PSChildName)`""
						InstallType  = 'System'
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
				foreach ($profileItem in $profiles) {
					$profileName = $profileData.profile.info_cache."$profileItem".name
					[pscustomobject]@{
						ProfileID    = $profileItem
						Path         = Join-Path $rootpath $profileItem
						CommandLine  = "brave-browser --profile-directory=`"$profileItem`""
						Name         = $profileName
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
				} elseif (Test-Path -Path '/usr/bin/firefox') {
					$installType = 'System'
					$rootpath    = '/usr/lib/firefox'
				} else {
					throw "Firefox Browser not installed"
				}
				$profpath = Join-Path $rootpath "profiles.ini"
				Write-Verbose "Looking for Firefox profiles.ini at: $profpath"
				#if (!(Test-Path $profpath)) { throw "File not found: $profpath" }
				if (Test-Path -Path $profpath) {
					$profileData    = Get-IniContent -FilePath $profpath -IgnoreComments
					$profiles       = $profileData.Keys | Where-Object { $_ -match 'Profile\d' }
					$defaultProfile = $profileData.Item('Profile0')['Path']
					$defPath        = Join-Path $rootpath $defaultProfile
					$compFile       = Join-Path $defPath 'compatibility.ini'
					$buildinfo      = $((Get-IniContent -FilePath $compFile -IgnoreComments)['Compatibility']['LastVersion'] -Split "_")[0]
					foreach ($profileItem in $profiles) {
						$profileName = $profileData.Item($profileItem)['Name']
						$profilePath = $profileData.Item($profileItem)['Path']
						[pscustomobject]@{
							ProfileID    = $profileItem
							Path         = Join-Path $rootpath $profilePath
							CommandLine  = "firefox -P `"$profileItem`""
							Name         = $profileName
							Browser      = $Browser
							Version      = $buildinfo
							InstallType  = $installType
							ComputerName = $(hostname)
							UserName     = $($env:USER)
						}
					}
				} else {
					Write-Output "No profiles found for Firefox at: $profpath"
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
				foreach ($profileItem in $profileIDs) {
					$pdata = $profiles.Item($profileItem)
					$profileName = $pdata['Name']
					$profilePath = $pdata['Path']
					[pscustomobject]@{
						ProfileID    = $profileItem
						Path         = Join-Path $rootpath "Profiles\$profilePath"
						CommandLine  = "firefox -P `"$profileItem`""
						Name         = $profileName
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
