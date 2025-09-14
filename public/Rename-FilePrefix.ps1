function Rename-FilePrefix {
	<#
	.SYNOPSIS
	Renames files by adding a specified prefix to their names.

	.DESCRIPTION
	This function renames files in a specified directory by adding a given prefix to their names.
	It supports -WhatIf and -Confirm parameters for safe execution.

	.PARAMETER Path
	The directory path where the files are located.

	.PARAMETER Filter
	The filter to select specific files (e.g., *.txt).

	.PARAMETER Prefix
	The prefix to add to the beginning of each file name.

	.EXAMPLE
	Rename-FilePrefix -Path "C:\Files" -Filter "*.txt" -Prefix "New_"
	Renames all .txt files in C:\Files by adding "New_" to the beginning of each file name.
	Example filename change: "Report.txt" to "New_Report.txt".

	.LINK
	https://github.com/Skatterbrainz/helium/blob/master/docs/Rename-FilePrefix.md
	#>
	[CmdletBinding(SupportsShouldProcess=$True, ConfirmImpact='High')]
	param (
		[parameter(Mandatory=$True)][string]$Path,
		[parameter(Mandatory=$True)][string]$Filter,
		[parameter(Mandatory=$True)][string]$Prefix
	)

	if (Test-Path -Path $Path) {
		$files = Get-ChildItem -Path $Path -Filter $Filter -File | Where-Object {$_.Name -notlike "$Prefix*"}
		foreach ($file in $files) {
			$newName = "$Prefix$($file.Name)"
			$target = "File"
			$action = "Rename '$($file.Name)' to '$newName'"
			if ($PSCmdlet.ShouldProcess($target, $action)) {
				Rename-Item -Path $file.FullName -NewName $newName
			}
			[pscustomobject]@{
				OldName = $file.Name
				NewName = $newName
			}
		}
	} else {
		Write-Error "The specified path '$Path' does not exist."
	}
}