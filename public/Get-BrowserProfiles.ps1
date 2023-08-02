function Get-BrowserProfile {
	<#
	.SYNOPSIS
		Query Browser Profiles
	.DESCRIPTION
		Query Browser profiles, returning ID, Name and UserName. For current user or all users
	.PARAMETER Browser
		Optional. Browser app to target for query (if installed)
		* Default = Get default browser from registry query
		* Chrome
		* Edge
		* Brave
		* Firefox
	.PARAMETER ProfileName
		Return information on one specific profile only
	.PARAMETER PreferenceDetails
		If ProfileName is specified, will return the Preferences object
	.PARAMETER AllUsers
		Query all users on the computer
	.EXAMPLE
		Get-BrowserProfile
	.EXAMPLE
		Get-BrowserProfile -Browser Edge
	.EXAMPLE
		Get-BrowserProfile -Browser Chrome -AllUsers
	.EXAMPLE
		Get-BrowserProfile -ProfileName "Azure" -PreferenceDetails
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-BrowserProfile.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$False)][string]$ProfileName = "",
		[parameter(Mandatory=$False)][switch]$PreferenceDetails,
		[parameter(Mandatory=$False)][string][ValidateSet('Chrome','Edge','Brave','Firefox','Default')]$Browser = 'Default',
		[parameter(Mandatory=$False)][switch]$AllUsers
	)
	$results = @()
	if (!$AllUsers) {
		if ($Browser -eq 'Default') {
			$app = Get-DefaultBrowser
		} else {
			$app = $Browser
		}
		switch ($app) {
			'Chrome' {
				$profilePath = "$env:LOCALAPPDATA\Google\Chrome\User Data"
				[array]$profileFolders = Get-ChildItem -Path $profilePath -Directory -Filter "Profile*" | select-object Name,FullName
			}
			'Brave' {
				$profilePath = "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data"
				[array]$profileFolders = Get-ChildItem -Path $profilePath -Directory -Filter "Profile*" | select-object Name,FullName
			}
			'Edge' {
				$profilePath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data"
				[array]$profileFolders = Get-ChildItem -Path $profilePath -Directory -Filter "Profile*" | select-object Name,FullName
			}
			'Firefox' {
				$profilePath = "$env:APPDATA\Mozilla\Firefox\Profiles"
				[array]$profileFolders = Get-ChildItem -Path $profilePath -Directory | select-object Name,FullName
			}
		}
		if ($app -ne 'Firefox') {
			foreach ($folder in $profileFolders) {
				[string]$pref = Join-Path $folder.FullName "Preferences"
				if (Test-Path $pref) {
					$prefdata = Get-Content $pref -Raw | ConvertFrom-Json
					$pname = $prefdata.profile.name
					$results += [pscustomobject]@{
						UserName    = $env:USERNAME
						ProfileID   = $folder.Name
						ProfileName = $pname
						Browser     = $app
						Path        = $folder.FullName
					}
				}
			}
		} else {
			foreach ($folder in $profileFolders) {
				$prefdata = $folder.Name.Split('.')
				$pname = $prefdata[1]
				$results += [pscustomobject]@{
					UserName    = $env:USERNAME
					ProfileID   = $folder.Name
					ProfileName = $pname
					Browser     = $app
					Path        = $folder.FullName
				}
			}
		}
	} else {
		$exclude = @('AppData','Public')
		if ($Browser -eq 'Default') {
			$app = Get-DefaultBrowser
		} else {
			$app = $Browser
		}
		switch ($app) {
			'Chrome' {
				$profileSub = "AppData\Google\Chrome\User Data"
			}
			'Brave' {
				$profileSub = "AppData\Local\BraveSoftware\Brave-Browser\User Data"
			}
			'Edge' {
				$profileSub = "AppData\Local\Microsoft\Edge\User Data"
			}
			'Firefox' {
				$profileSub = 'AppData\Local\Mozilla\Firefox\Profiles'
			}
		}
		[array]$userprofiles = Get-ChildItem -Path "c:\users" -Directory | Where-Object {$_.name -notin $exclude} | Select-Object Name,FullName
		Write-Verbose "$($userprofiles.Count) user profiles found"
		foreach ($userpath in $userprofiles) {
			$profilePath = Join-Path $($userpath.FullName) $profileSub
			Write-Verbose "reading: $profilePath"
			if ($app -ne 'Firefox') {
				[array]$profileFolders = Get-ChildItem -Path $profilePath -Directory -Filter "Profile*" | select-object Name,FullName
				foreach ($folder in $profileFolders) {
					[string]$pref = Join-Path $folder.FullName "Preferences"
					if (Test-Path $pref) {
						$prefdata = Get-Content $pref -Raw | ConvertFrom-Json
						$pname = $prefdata.profile.name
						$results += [pscustomobject]@{
							UserName    = $userpath.Name
							ProfileID   = $folder.Name
							ProfileName = $pname
							Browser     = $app
							Path        = $folder.FullName
						}
					}
				}
			} else {
				[array]$profileFolders = Get-ChildItem -Path $profilePath -Directory | select-object Name,FullName
				foreach ($folder in $profileFolders) {
					$prefdata = $folder.Name.Split('.')
					$pname = $prefdata[1]
					$results += [pscustomobject]@{
						UserName    = $env:USERNAME
						ProfileID   = $folder.Name
						ProfileName = $pname
						Browser     = $app
						Path        = $folder.FullName
					}
				}
			}
		}
	}
	if (![string]::IsNullOrWhiteSpace($ProfileName)) {
		if ($PreferenceDetails) {
			$ppath = $results | Where-Object {$_.ProfileName -eq $ProfileName} | Select-Object -ExpandProperty Path
			$pref = Join-Path $ppath "Preferences"
			Get-Content -Path $pref | ConvertFrom-Json
		} else {
			$results | Where-Object {$_.ProfileName -eq $ProfileName}
		}
	} else {
		$results
	}
}
