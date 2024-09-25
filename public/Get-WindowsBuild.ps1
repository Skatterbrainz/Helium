function Get-WindowsBuild {
	<#
	.SYNOPSIS
		Returns list of Windows build numbers and versions. Optionally filter by build number.
	.DESCRIPTION
		Returns list of Windows build numbers and versions. Optionally filter by build number.
	.PARAMETER BuildNumber
		Filter by build number. If omitted, returns all build numbers.
	.EXAMPLE
		Get-WindowsBuild
		Returns all Windows build numbers and versions.
	.EXAMPLE
		Get-WindowsBuild -BuildNumber 19041
		Returns Windows build number 19041 and version (Windows 10 2004)
	.NOTES
		https://gist.github.com/Skatterbrainz/9306ed76f08fb7e6868b8b7a1fc544c5
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WindowsBuild.md
	#>
	param (
		[Parameter(Mandatory = $false)][string]$BuildNumber
	)
	$url = 'https://gist.githubusercontent.com/Skatterbrainz/9306ed76f08fb7e6868b8b7a1fc544c5/raw/e621f0a5ff969909a47243c9aa7ce154814a8854/windowsversions.json'
	$vdata = Invoke-WebRequest -Uri $url -UseBasicParsing -ErrorAction Stop | Select-Object -ExpandProperty Content | ConvertFrom-Json
	if (![string]::IsNullOrEmpty($BuildNumber)) {
		$vdata | Where-Object {$_.buildNumber -eq $BuildNumber.Trim()}
	} else {
		$vdata
	}
}
