<#
.SYNOPSIS
	Find text string pattern within XLSX files in a given location
.DESCRIPTION
	Search all XLSX workbook files for matching text string and return
	information about the workbook, worksheet, matching value, and location
.PARAMETER Path
	Path (folder) where .XLSX files reside
.PARAMETER SearchPattern
	Text string to search for
.PARAMETER SaveFile
	Save output to CSV file
.PARAMETER OutputFile
	CSV output path+filename
.PARAMETER NoRecurse
	Scan xlsx files in Path location only, do not scan into subfolders
.EXAMPLE
	.\Find-ExcelWorkbookText.ps1 -Path "\\server123\docs" -SearchPattern "Server543" -SaveFile
	
	Searches for instances of "Server543" within any cells on any sheets of workbooks in 
	the path \\server123\docs, and save to CSV file.
.EXAMPLE
	Find-ExcelWorkbookText -Path "\\server123\docs" -SearchPattern "Server543" -SaveFile -NoRecurse
	
	Searches for instances of "Server543" within any cells on any sheets of workbooks in 
	the path \\server123\docs, but no subfolders, and save to CSV file.
.EXAMPLE
	$results = Find-ExcelWorkbookText -Path "\\server123\docs" -SearchPattern "Server543"
	$results | Group-Object Workbook | Select-Object Count,Name

	Returns counts of matching instances by workbook filename
.LINK
	https://github.com/Skatterbrainz/helium/blob/master/docs/Find-ExcelWorkbookText.md
#>
[CmdletBinding()]
param (
	[parameter(Mandatory=$False)][string]$Path = "",
	[parameter(Mandatory=$False)][string]$SearchPattern = "",
	[parameter(Mandatory=$False)][switch]$SaveFile,
	[parameter(Mandatory=$False)][switch]$NoRecurse,
	[parameter(Mandatory=$False)][string]$OutputFile = "$($env:HOME)\Documents\excel_search_$(Get-Date -f 'yyyyMMddhhmm').csv"
)

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
	$results = @()
	Write-Verbose "opening microsoft excel session"
	try {
		$Excel = New-Object -ComObject Excel.Application
	} catch {
		throw "Microsoft Excel does not appear to be installed."
	}
	Write-Verbose "requesting files from $Path"
	if ($NoRecurse) {
		[array]$files = Get-ChildItem -Path $Path -Filter *.xlsx -ErrorAction Stop
	} else {
		[array]$files = Get-ChildItem -Path $Path -Filter *.xlsx -Recurse -ErrorAction Stop
	}
	
	Write-Verbose "$($files.Count) workbook files were found in folder"
	foreach ($file in $files) {
		Write-Verbose "workbook: $($file.FullName)"
		$Workbook = $Excel.Workbooks.Open($file.FullName,$null,$True)
		Write-Verbose "`t$($Workbook.Sheets.Count) worksheets found in workbook"
		foreach ($Worksheet in @($Workbook.Sheets)) {
			Write-Verbose "`tworksheet: $($Worksheet.Name)"
			$Found = $WorkSheet.Cells.Find($SearchPattern)
			if ($Found) {
				Write-Verbose "`tmatches = FOUND"
				$BeginAddress = $Found.Address(0,0,1,1)
				$match = [pscustomobject]@{
					Workbook  = $file.FullName
					WorkSheet = $Worksheet.Name
					Column    = $Found.Column
					Row       = $Found.Row
					Text      = $Found.Text
					Address   = $BeginAddress
				}
				$results += $match
				$match
				do {
					$Found = $WorkSheet.Cells.FindNext($Found)
					$Address = $Found.Address(0,0,1,1)
					
					if ($Address -eq $BeginAddress) { break }
					Write-Verbose "`tmatches = FOUND"
					$match = [pscustomobject]@{
						Workbook  = $file.FullName
						WorkSheet = $Worksheet.Name
						Column    = $Found.Column
						Row       = $Found.Row
						Text      = $Found.Text
						Address   = $Address
					}
					$results += $match
					$match
				} until ($False)
			} else {
				Write-Verbose "`tmatches = none"
			}
		} # foreach worksheet
		Write-Verbose "closing workbook file"
		$workbook.close($false)
	} # foreach file
	Write-Verbose "finished processing $($files.count) workbook files"
} catch {
	$_.Exception
} finally {
	Write-Verbose "cleaning up session"
	release-comobject $worksheet
	release-comobject $workbook
	release-comobject $excel
	[gc]::Collect()
	[gc]::WaitForPendingFinalizers()
	Remove-Variable excel -ErrorAction SilentlyContinue
	Get-Process 'excel' | Stop-Process -Force
	if ($SaveFile) {
		$results | Export-Csv -Path $OutputFile -NoTypeInformation -Force
	} else {
		$results
	}
}
