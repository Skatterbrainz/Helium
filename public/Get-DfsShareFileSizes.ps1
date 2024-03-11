<#
.SYNOPSIS
.DESCRIPTION
.PARAMETER None
.LINK
https://github.com/Skatterbrainz/helium/blob/master/docs/Get-DfsShareFileSizes.md
#>
function Get-DfsShareFileSizes {
	param ()
	try {
		if (!$Formatted.IsPresent) {
			Get-DfsnRoot -ErrorAction Stop | Select-Object Path | Foreach-Object {
				Get-ChildItem -Path $_ -Recurse -ErrorAction SilentlyContinue |
					Select-Object FullName,@{l='SizeGB';e={[math]::Round($_.Length / 1GB, 1)}}
			}
		} else {
			Get-DfsnRoot -ErrorAction Stop | Select-Object Path | Foreach-Object {
				Get-ChildItem -Path $_ -Recurse -ErrorAction SilentlyContinue |
					Select-Object FullName,@{l='SizeGB';e={[math]::Round($_.Length / 1GB, 1)}} |
						Sort-Object Length -Descending |
							Select-Object -First $topCount
			}
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}