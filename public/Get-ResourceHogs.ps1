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
		[parameter()]
			[string]
			[ValidateSet('CPU','WorkingSet','MaxWorkingSet','HandleCount','VirtualMemorySize','PagedMemorySize64','PagedSystemMemorySize','PeakVirtualMemorySize')]
			$Metric = 'CPU',
		[parameter()][int][ValidateRange(0,100)]$Top = 10,
		[parameter()][switch]$ShowPath
	)
	$outprops = @('ProcessName','Id',$Metric)
	if ($ShowPath) { $outprops += 'Path' }
	$outparams = @{ First = $Top; Property = $outprops }
	Get-Process | Group-Object ProcessName |
		ForEach-Object { $_.Group | Sort-Object $Metric -Descending | Select-Object -First 1 } |
			Sort-Object $Metric -Descending | Select-Object @outparams
}