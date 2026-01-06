function Get-ResourceHogs {
	<#
	.SYNOPSIS
		Show Windows processes using the most resources
	.DESCRIPTION
		Show Windows processes using the most resources by selected properties/metrics
	.PARAMETER Metric
		The process property to sort by. Default is CPU
	.PARAMETER Top
		Limit the output to the first [Top] items, sorted in descending order (most to least)
	.PARAMETER ShowPath
		Include process Path property in output.
	.EXAMPLE
		Get-ResourceHog
	.EXAMPLE
		Get-ResourceHog -Metric WorkingSet
	.EXAMPLE
		Get-ResourceHog -Metric HandleCount -Top 5 ShowPath
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ResourceHogs.md
	#>
	param (
		[parameter(Mandatory=$False)]
			[string]
			[ValidateSet('CPU','WorkingSet','MaxWorkingSet','HandleCount','VirtualMemorySize','PagedMemorySize64','PagedSystemMemorySize','PeakVirtualMemorySize')]
			$Metric = 'CPU',
		[parameter(Mandatory=$False)][int][ValidateRange(0,100)]$Top = 10,
		[parameter(Mandatory=$False)][switch]$ShowPath
	)
	try {
		if ($PSVersionTable.Platform -eq 'Unix') { throw "No supported on Linux systems" }
		$outprops = @('ProcessName','Id',$Metric)
		if ($ShowPath) { $outprops += 'Path' }
		$outparams = @{ First = $Top; Property = $outprops }
		Get-Process | Group-Object ProcessName |
			ForEach-Object { $_.Group | Sort-Object $Metric -Descending | Select-Object -First 1 } |
				Sort-Object $Metric -Descending | Select-Object @outparams
	} catch {
		Write-Error $_.Exception.Message
	}
}