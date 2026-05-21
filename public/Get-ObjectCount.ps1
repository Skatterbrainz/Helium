function Get-ObjectCount {
	<#
    .SYNOPSIS
    Counts objects by a specified property.

    .PARAMETER InputObject
    The input object to be counted.

    .PARAMETER Property
    The property to group by.

    .PARAMETER First
    The number of top results to return.

	.EXAMPLE
	Get-ObjectCount -InputObject $data -Property Category

	This command counts the number of objects in $data grouped by the 'Category' property.

	.EXAMPLE
	Get-Process | Get-ObjectCount -Property Name -First 5

	This command counts the number of processes grouped by their name and returns the top 5 most common process names.

	Count    Name
	-----    ----
	10       chrome
	8        powershell
	5        code
	3        explorer
	2        notepad

	.NOTES
	This function is an alias for Count-Object, which is a more intuitive name for counting objects.
	This function was made possible by taking a nap, reading James Brundage's article on freeform functions,
	then taking another nap, reading it again, and finally writing this function in a burst of inspiration.
	#>
    [CmdletBinding()]
	[Alias('Count-Object')]
    param(
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)][PSObject]$InputObject,
        [Parameter(Mandatory=$true, Position = 0)][string[]]$Property,
        [Parameter(Mandatory=$false)][Alias('Top')][int]$First
    )

    $allInput = @($input)
    if (-not $allInput) { $allInput = @($InputObject) }

    $groupArgs = if ($Property) { @{ Property = $Property } } else { @{} }

    $result = $allInput | Group-Object @groupArgs | Select-Object Count, Name | Sort-Object Count -Descending

    if ($First) { $result | Select-Object -First $First } else { $result }
}