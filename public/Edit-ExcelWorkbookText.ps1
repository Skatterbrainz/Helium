function Edit-ExcelWorkbookText {
	<#
	.SYNOPSIS
		Find and Replace text a string pattern within XLSX files in a given location
	.DESCRIPTION
		Search all XLSX workbook files for matching text string and replace with a new text string.
	.PARAMETER Path
		Path (folder) where .XLSX files reside
	.PARAMETER SearchPattern
		Text string to search for
	.PARAMETER ReplaceWith
		Text string to insert in place of [SearchPattern] text string
	.PARAMETER LogFile
		CSV output path+filename
	.PARAMETER NoRecurse
		Scan xlsx files in Path location only, do not scan into subfolders
	.PARAMETER Apply
		Confirm saving changes to workbooks
	.EXAMPLE
		Edit-ExcelWorkbookText -Path "\\server123\docs" -SearchPattern "Server543" -ReplaceWith "Server9022" -Apply
		
		Replaces instances of "Server543" with "Server9022" within any cells on any sheets of workbooks in 
		the path \\server123\docs. Saves changes back to workbooks.
	.EXAMPLE
		Edit-ExcelWorkbookText -Path "\\server123\docs" -SearchPattern "Server543" -ReplaceWith "Server9022" -NoRecurse -Apply
		
		Searches for instances of "Server543" within any cells on any sheets of workbooks in 
		the path \\server123\docs, but no subfolders, and save to CSV file. Saves changes back to workbooks.
	.EXAMPLE
		$results = Edit-ExcelWorkbookText -Path "\\server123\docs" -SearchPattern "Server543" -ReplaceWith "Server9022"
		$results | Group-Object Workbook | Select-Object Count,Name

		Returns counts of matching instances by workbook filename
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Edit-ExcelWorkbookText.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$False)][string]$Path = '$($env:HOME)\Documents',
		[parameter(Mandatory=$False)][string]$SearchPattern = '',
		[parameter(Mandatory=$False)][string]$ReplaceWith = '',
		[parameter(Mandatory=$False)][switch]$Apply
	)
	[string]$LogFile = "$($env:HOME)\Documents\excel_replace_$(Get-Date -f 'yyyyMMddhhmm').csv"

	if ([string]::IsNullOrEmpty($Path) -or [string]::IsNullOrEmpty($SearchPattern)) {
		Write-Warning "Path and SearchPattern inputs cannot be empty"
		break
	}
	if (!(Test-Path $Path)) {
		Write-Warning "Path not found: $Path"
		break
	}

	function release-comobject($ref) {
		while ([System.Runtime.InteropServices.Marshal]::ReleaseComObject($ref) -gt 0) {}
		[void][System.GC]::Collect()
	}

	try {
		[array]$files = Get-ChildItem -Path $Path -Filter "*.xlsx" -ErrorAction Stop
		Write-Host "$($files.Count) workbook files were found"
	} catch {
		Write-Warning "Unable to retrieve any workbook files from $Path"
	}

	Write-Verbose "Opening excel application session"
	$excel = New-Object -ComObject Excel.Application
	$excel.Visible = $False

	$logresults = @()

	Write-Host "Begin processing"
	foreach ($file in $files) {
		Write-Host "file: $($file.FullName)"
		$Workbook = $Excel.Workbooks.Open($file.FullName)
		$worksheets = $workbook.Worksheets
		foreach ($worksheet in $worksheets) {
			Write-Verbose "worksheet: $($worksheet.Name)"
			$found = $worksheet.UsedRange.Find($SearchPattern)
			if ($null -ne $found) {
				Write-Verbose "match was found"
				$address1 = $found.Address(0,0,1,1)
				$row = $found.Row
				$col = $found.Column
				[string]$formula = $worksheet.cells($row,$col).Formula
				[string]$changed = $formula.Replace($SearchPattern,$ReplaceWith)
				if ($formula -ne $changed) {
					if ($Apply) { 
						$worksheet.Cells($row,$col).Formula = $changed
						$logresults += (
							[PSCustomObject]@{
								File      = $file.FullName
								Worksheet = $($worksheet.Name)
								Row       = $row
								Column    = $col
								OldText   = $formula
								NewText   = $changed
							}
						)
					}
				}
				while ($found = $worksheet.UsedRange.FindNext($found)) {
					$address2 = $found.Address(0,0,1,1)
					if ($address1 -eq $address2) { break }
					$row = $found.Row
					$col = $found.Column
					[string]$formula = $worksheet.cells($row,$col).Formula
					[string]$changed = $formula.Replace($SearchPattern,$ReplaceWith)
					if ($formula -ne $changed) {
						if ($Apply) {
							$worksheet.Cells($row,$col).Formula = $changed
							$logresults += (
								[PSCustomObject]@{
									File      = $file.FullName
									Worksheet = $($worksheet.Name)
									Row       = $row
									Column    = $col
									OldText   = $formula
									NewText   = $changed
								}
							)
						}
					}
				} # while
			} else {
				Write-Verbose "no matches found"
			}
		} # foreach worksheet
		if ($Apply) {
			if (!$workbook.Saved) {
				Write-Verbose "saving changes to workbook"
				$workbook.Save()
			}
		}
		$workbook.Close($False)
	} # foreach file

	$excel.quit()

	Write-Verbose "release: worksheet"
	release-comobject $worksheet
	Write-Verbose "release: worksheets"
	release-comobject $worksheets
	Write-Verbose "release: workbook"
	release-comobject $workbook
	Write-Verbose "terminating all excel.exe processes"
	Get-Process 'excel' | Stop-Process -Force

	if ($logresults.Count -gt 0) {
		$logresults | Export-Csv -Path $LogFile -NoTypeInformation -Force
		Write-Host "Complete! Change log saved to $LogFile"
	} else {
		Write-Host "Complete! No changes were applied"
	}
}