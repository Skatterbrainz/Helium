function Rename-FileParse {
	<#
	.SYNOPSIS
	Renames files by parsing their names based on a specified delimiter and optionally adding spaces around the delimiter

	.DESCRIPTION
	This function renames files in a specified directory by splitting their names into parts based on a given
	delimiter. It can also add spaces around the delimiter if specified. The function supports -WhatIf and -Confirm parameters 
	for safe execution.

	.PARAMETER Path
	The directory path where the files are located.

	.PARAMETER Filter
	The filter to select specific files (e.g., *.txt).

	.PARAMETER Delimiter
	The delimiter used to split the file names (default is '-').

	.PARAMETER PadSpaces
	Switch to add spaces around the delimiter in the new file names.

	.EXAMPLE
	Rename-FileParse -Path "C:\Files" -Filter "*.txt" -Delimiter "-" -PadSpaces

	Renames all .txt files in C:\Files by splitting their names at '-' and adding spaces around the delimiter.
	Example filename change: "Report-2023.txt" to "2023 - Report.txt".

	.LINK
	https://github.com/Skatterbrainz/helium/blob/master/docs/Rename-FileParse.md
	#>
	[CmdletBinding(SupportsShouldProcess=$True, ConfirmImpact='High')]
	param (
		[parameter(Mandatory=$True)][string]$Path,
		[parameter(Mandatory=$True)][string]$Filter,
		[parameter(Mandatory=$False)][string]$Delimiter = "-",
		[parameter(Mandatory=$False)][switch]$PadSpaces
	)

	if (Test-Path -Path $Path) {
		$files = Get-ChildItem -Path $Path -Filter $Filter -File
		foreach ($file in $files) {
			$baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
			$extension = $file.Extension
			$parts = $baseName -split [regex]::Escape($Delimiter) | ForEach-Object { $_.Trim() }
			if ($parts.Count -eq 2) {
				[array]::Reverse($parts)
				if ($PadSpaces.IsPresent) {
					$newBaseName = ($parts -join " $Delimiter ")
				} else {
					$newBaseName = ($parts -join $Delimiter).Trim()
				}
				$newName = "$($newBaseName)$($extension)"
				# if -WhatIf is invoked, just simulate the rename
				$target = "File"
				$action = "Rename '$($file.Name)' to '$newName'"
				if ($PSCmdlet.ShouldProcess($target, $action)) {
					Rename-Item -Path $file.FullName -NewName $newName
				}
				[pscustomobject]@{
					OldName = $file.Name
					NewName = $newName
				}
			} else {
				Write-Warning "File '$($file.Name)' does not contain exactly two parts separated by '$Delimiter'. Skipping."
				continue
			}
		}
	} else {
		Write-Error "The specified path '$Path' does not exist."
	}
}