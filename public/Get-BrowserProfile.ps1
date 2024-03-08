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
	.PARAMETER ProfileName
		Return information on one specific profile only
	.EXAMPLE
		Get-BrowserProfile -Browser Edge
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-BrowserProfile.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$True)][string][ValidateSet('Chrome','Edge')]$Browser,
		[parameter(Mandatory=$False)][string]$ProfileName,
		[parameter(Mandatory=$False)][switch]$PreferenceDetails
	)
	switch ($Browser) {
		'Chrome' {
			if ($IsLinux) {
				$rootpath = '~/.var/app/com.google.Chrome/config/google-chrome'
				$profpath = "$rootpath/Local State"
				if (!(Test-Path $profpath)) { throw "File not found: $profpath" }
				$profileData = Get-Content $profpath| ConvertFrom-Json
				$buildinfo   = Get-Content '~/.var/app/com.google.Chrome/config/google-chrome/Last Version'
				$profiles    = $profileData.profile.info_cache.psobject.Properties.Name
				foreach ($profile in $profiles) {
					$pname = $profileData.profile.info_cache."$profile".name
					if (([string]::IsNullOrWhiteSpace($ProfileName)) -or ((![string]::IsNullOrWhiteSpace($ProfileName)) -and $ProfileName -eq $pname)) {
						[pscustomobject]@{
							ProfileID    = $profile
							Path         = Join-Path $rootpath $profile
							Name         = $pname
							Browser      = $Browser
							Version      = $buildinfo
							ComputerName = $(hostname)
							UserName     = $($env:USER)
						}
					}
				}
			} else {
				$rootpath = "$env:LOCALAPPDATA\Google\Chrome\User Data"
				# NEED TO REDO THIS SECTION
			}
		}
		'Edge' {
			if ($IsLinux) {
				$rootpath = '~/.var/app/com.microsoft.Edge/config/microsoft-edge'
				$profpath = "$rootpath/Local State"
				if (!(Test-Path $profpath)) { throw "File not found: $profpath" }
				$profileData = Get-Content $profpath | ConvertFrom-Json
				$buildinfo   = Get-Content '~/.var/app/com.microsoft.Edge/config/microsoft-edge/Last Version'
				$profiles    = $profileData.profile.info_cache.psobject.Properties.Name
				foreach ($profile in $profiles) {
					$pname = $profileData.profile.info_cache."$profile".name
					if (([string]::IsNullOrWhiteSpace($ProfileName)) -or ((![string]::IsNullOrWhiteSpace($ProfileName)) -and $ProfileName -eq $pname)) {
						[pscustomobject]@{
							ProfileID    = $profile
							Path         = Join-Path $rootpath $profile
							Name         = $pname
							Browser      = $Browser
							Version      = $buildinfo
							ComputerName = $(hostname)
							UserName     = $($env:USER)
						}
					}
				}
			} else {
				$rootpath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data"
				# NEED TO REDO THIS SECTION
			}
		}
		# might add Brave and other Chromium-based options later. Firefox dropped profiles so they won't be added
	}
}
