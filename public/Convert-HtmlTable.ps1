function Convert-HtmlTable {
	<#
	.SYNOPSIS
		Convert HTML Table rows into objects
	.DESCRIPTION
		Convert HTML table rows into objects
	.PARAMETER Path
		HTML file path
	.EXAMPLE
		Convert-HtmlTable -Path "c:\temp\myfile.htm"
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Convert-HtmlTable.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true, ValueFromPipeline=$true)][string]$Path
	)
	if (Test-Path $Path) {
		Write-Verbose "reading file: $path"
		try {
			[xml]$content = Get-Content -Path $Path
			$tablerows = $($content.html.body.table.tr)
			Write-Verbose "$($tablerows.Count) table rows imported"
			$result = [ordered]@{}
			if ($tablerows.Count -ge 2) {
				$columns = $tablerows[0].th
				foreach ($row in $tablerows[1..1000]) {
					for ($i = 0; $i -lt $columns.Count; $i++) {
						$result["$($columns[$i])"] = $row.td[$i]
					}
					[pscustomobject]$result
				}
			}
		} catch {
			Write-Error $_.Exception.Message
		}
	} else {
		throw "File not found: $Path"
	}
}
