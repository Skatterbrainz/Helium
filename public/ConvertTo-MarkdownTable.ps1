function ConvertTo-MarkdownTable {
	<#
	.SYNOPSIS
		Converts an array of objects into a markdown table format.
	.DESCRIPTION
		This function takes an array of objects and generates a markdown table string. Each object's properties will be used as columns in the table, and the values will populate the rows.
	.PARAMETER InputObject
		An array of objects to be converted into a markdown table. Each object should have the same properties for consistent column headers.
	.EXAMPLE
		$data = @(
			[PSCustomObject]@{ Name = "Alice"; Age = 30; City = "New York" },
			[PSCustomObject]@{ Name = "Bob"; Age = 25; City = "Los Angeles" },
			[PSCustomObject]@{ Name = "Charlie"; Age = 35; City = "Chicago" }
		)
		$markdownTable = $data | ConvertTo-MarkdownTable
		Write-Output $markdownTable
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-MarkdownTable.md
	#>
	[CmdletBinding()]
	[OutputType([string])]
	param (
		[Parameter(ValueFromPipeline = $true)]
		[object[]]$InputObject
	)

	begin {
		$table = @()
	}

	process {
		foreach ($item in $InputObject) {
			if ($item -is [PSCustomObject]) {
				$table += $item
			} else {
				Write-Warning "Skipping non-object item: $item"
			}
		}
	}

	end {
		if ($table.Count -gt 0) {
			# Get the property names for the header
			$headers = $table[0].PSObject.Properties.Name
			# Create the markdown table header
			$markdown = "| " + ($headers -join " | ") + " |`n"
			$markdown += "| " + ($headers | ForEach-Object { "---" }) -join " | " + " |`n"

			# Add the rows to the markdown table
			foreach ($row in $table) {
				$markdown += "| " + ($headers | ForEach-Object { $row.$_ }) -join " | " + " |`n"
			}

			return $markdown
		} else {
			Write-Warning "No valid objects to convert to markdown table."
		}
	}
}