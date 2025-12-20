function Export-Bookmarks {
	<#
	.SYNOPSIS
		Export Browser Bookmarks to HTML
	.DESCRIPTION
		Export browser bookmarks to HTML format for one or all profiles of a specified browser.
	.PARAMETER Brave
		Export bookmarks from Brave browser
	.PARAMETER Chrome
		Export bookmarks from Chrome browser
	.PARAMETER Edge
		Export bookmarks from Edge browser
	.PARAMETER Firefox
		Export bookmarks from Firefox browser
	.PARAMETER All
		Export bookmarks from all profiles of the specified browser
	.PARAMETER InputFile
		Optional. Path to a bookmarks JSON file to export
	.PARAMETER OutputFile
		Optional. Path to save the exported HTML bookmarks file
	.EXAMPLE
		Export-Bookmarks -Chrome -All
		Exports bookmarks from all Chrome profiles to HTML files in the user's home directory.
	.EXAMPLE
		Export-Bookmarks -Firefox -OutputFile "C:\Users\User\Desktop\firefox_bookmarks.html"
		Exports bookmarks from the default Firefox profile to the specified HTML file.
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Export-Bookmarks.md
	#>
	[CmdletBinding()]
	param(
		[parameter(Mandatory = $false)][switch]$Brave,
		[parameter(Mandatory = $false)][switch]$Chrome,
		[parameter(Mandatory = $false)][switch]$Edge,
		[parameter(Mandatory = $false)][switch]$Firefox,
		[parameter(Mandatory = $false)][switch]$All,
		[parameter(Mandatory = $false)][string]$InputFile,
		[parameter(Mandatory = $false)][string]$OutputFile
	)

	function Get-BrowserPath {
		param([string]$browser)
		
		if ($IsLinux) {
			$paths = @{
				'brave-flatpak' = "$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser"
				'brave-native' = "$HOME/.config/BraveSoftware/Brave-Browser"
				'chrome-flatpak' = "$HOME/.var/app/com.google.Chrome/config/google-chrome"
				'chrome-native' = "$HOME/.config/google-chrome"
				'edge-flatpak' = "$HOME/.var/app/com.microsoft.Edge/config/microsoft-edge"
				'edge-native' = "$HOME/.config/microsoft-edge"
				'firefox' = "$HOME/.mozilla/firefox"
			}
		} else {
			$paths = @{
				'brave' = "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data"
				'chrome' = "$env:LOCALAPPDATA\Google\Chrome\User Data"
				'edge' = "$env:LOCALAPPDATA\Microsoft\Edge\User Data"
			}
		}

		foreach ($key in $paths.Keys | Where-Object { $_ -like "$browser-*" }) {
			if (Test-Path $paths[$key]) {
				return $paths[$key]
			}
		}
		
		return $null
	}

	function Get-ProfileName {
		param([string]$profilePath, [string]$browserPath)
		
		$profileDir = Split-Path $profilePath -Leaf
		$localState = Join-Path $browserPath "Local State"
		
		if (Test-Path $localState) {
			$state = Get-Content $localState | ConvertFrom-Json
			if ($state.profile.info_cache.$profileDir.name) {
				return $state.profile.info_cache.$profileDir.name
			}
		}
		
		$prefsFile = Join-Path $profilePath "Preferences"
		if (Test-Path $prefsFile) {
			$prefs = Get-Content $prefsFile | ConvertFrom-Json
			if ($prefs.profile.name) {
				return $prefs.profile.name
			}
		}
		
		if ($profileDir -eq "Default") { return "Default" }
		return $profileDir -replace '^Profile ', 'Profile_'
	}

	function Convert-BookmarkNode {
		param($node, $indent = 1, [string]$folderName = "")
		
		$html = ""
		$spaces = "    " * $indent
		
		if ($node.children) {
			if ($folderName) {
				$html += "$spaces<DT><H3>$folderName</H3>`n"
				$html += "$spaces<DL><p>`n"
			}
			foreach ($child in $node.children) {
				if ($child.type -eq "folder") {
					$html += Convert-BookmarkNode $child ($indent + 1) $child.name
				}
				elseif ($child.type -eq "url") {
					$addDate = [Math]::Floor([int64]$child.date_added / 1000000 - 11644473600)
					$html += "$($spaces)    <DT><A HREF=`"$($child.url)`" ADD_DATE=`"$addDate`">$($child.name)</A>`n"
				}
			}
			if ($folderName) {
				$html += "$spaces</DL><p>`n"
			}
		}
		
		return $html
	}

	# Determine browser
	$browserName = ""
	if ($Brave) { $browserName = "brave" }
	elseif ($Chrome) { $browserName = "chrome" }
	elseif ($Edge) { $browserName = "edge" }
	elseif ($Firefox) { $browserName = "firefox" }
	elseif (-not $InputFile) {
		Write-Error "Specify a browser (--Brave, --Chrome, --Edge, --Firefox) or provide --InputFile"
		exit 1
	}

	function Export-Bookmarks {
		param([string]$inputPath, [string]$outputPath)
		
		$bookmarks = Get-Content $inputPath | ConvertFrom-Json
		
		$html = @"
<!DOCTYPE NETSCAPE-Bookmark-file-1>
<!-- This is an automatically generated file.
	It will be read and overwritten.
	DO NOT EDIT! -->
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<TITLE>Bookmarks</TITLE>
<H1>Bookmarks</H1>
<DL><p>
"@
		
		$html += Convert-BookmarkNode $bookmarks.roots.bookmark_bar 1 "Bookmarks Bar"
		$html += Convert-BookmarkNode $bookmarks.roots.other 1 "Other Bookmarks"
		
		$html += "</DL><p>`n"
		
		$html | Out-File -FilePath $outputPath -Encoding utf8
		Write-Host "Exported: $outputPath"
	}

	if ($InputFile) {
		$OutputFile = if ($OutputFile) { $OutputFile } else { "$HOME/bookmarks.html" }
		Export-Bookmarks $InputFile $OutputFile
		exit 0
	}

	$browserPath = Get-BrowserPath $browserName
	if (-not $browserPath) {
		Write-Error "$browserName not found"
		exit 1
	}

	if ($All) {
		$profiles = Get-ChildItem $browserPath -Directory | Where-Object { 
			$_.Name -eq "Default" -or $_.Name -match "^Profile \d+$"
		}
		
		foreach ($profile in $profiles) {
			$bookmarksFile = Join-Path $profile.FullName "Bookmarks"
			if (Test-Path $bookmarksFile) {
				$profileName = Get-ProfileName $profile.FullName $browserPath
				$outputFile = "$HOME/$profileName.html"
				Export-Bookmarks $bookmarksFile $outputFile
			}
		}
	} else {
		$defaultBookmarks = Join-Path $browserPath "Default/Bookmarks"
		if (-not (Test-Path $defaultBookmarks)) {
			Write-Error "Bookmarks not found at $defaultBookmarks"
			exit 1
		}
		$OutputFile = if ($OutputFile) { $OutputFile } else { "$HOME/bookmarks.html" }
		Export-Bookmarks $defaultBookmarks $OutputFile
	}
}