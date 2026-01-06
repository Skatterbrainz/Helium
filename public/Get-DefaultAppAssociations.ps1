function Get-DefaultAppAssociations {
	<#
	.SYNOPSIS
		Get Windows default app associations table
	.DESCRIPTION
		Returns default app associations for the current user, saves to a file, and reuses the file for a specified number of days.
	.PARAMETER FilePath
		Path where export file is saved/maintained.
		Default path is user Documents path. Default filename is defaultapps.xml. For example: $($env:USERPROFILE)\Documents\defaultapps.xml
	.PARAMETER RefreshDays
		Number of days to reuse export file until forcing a refresh. The default value is 7 (days)
	.PARAMETER Force
		Force a refresh of the export file
	.EXAMPLE
		Get-DefaultAppAssociations
	.EXAMPLE
		Get-DefaultAppAssociations -Force
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-DefaultAppAssociations.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$False)][string]$FilePath = "$($env:HOME)\documents\defaultapps.xml",
		[parameter(Mandatory=$False)][int32]$RefreshDays = 7,
		[parameter(Mandatory=$False)][switch]$Force
	)
	if ($PSVersionTable.Platform -eq 'Unix') {
		Get-Content -Path "~/.config/mimeapps.list" | Select-String -Pattern '=' | ForEach-Object {
			$_.Line.Split('=')
		}
	} else {
		if (!(Test-Path $FilePath)) {
			Write-Verbose "creating new snapshot: $FilePath"
			$null = $(dism /Online /Export-DefaultAppAssociations:$FilePath)
		} else {
			Write-Verbose "checking the age of the last snapshot"
			if ($Force -or ($RefreshDays -eq 0) -or ((New-Timespan (Get-Item -Path $FilePath | Select-Object -ExpandProperty LastWriteTime) (Get-Date)).Days -gt $RefreshDays)) {
				Write-Verbose "file is older than $RefreshDays days - deleting file"
				$null = Remove-Item -Path $FilePath -Force
				Write-Verbose "creating new snapshot: $FilePath"
				$null = $(dism /Online /Export-DefaultAppAssociations:$FilePath)
			}
		}
		if (Test-Path $FilePath) {
			Write-Verbose "reading snapshot file to get app associations"
			$appdefs = [xml](Get-Content -Path $FilePath)
			Write-Verbose "returned $($appdefs.Count) app associations"
			Write-Output @($appdefs.DefaultAssociations.Association)
		} else {
			Write-Warning "unable to generate app associations snapshot file: $FilePath"
		}
	}
}