function Get-WindowsEvent {
	<#
	.SYNOPSIS
		Get Windows Event log items.
	.DESCRIPTION
		Get Windows Event log items based on flexible search parameters.
	.PARAMETER LogName
		Name of log. Default = System
	.PARAMETER Id
		Optional. One or more Event ID numbers. Separate multiple numbers with a comma.
		Example: -Id 114
		Example: -Id "113,114"
	.PARAMETER Source
		Optional. Windows Event provider name, such as "Microsoft-Windows-HttpService" (aka "HttpService")
	.PARAMETER StartTime
		Optional. Filter results on events which occured on or after StartTime (date and time)
	.PARAMETER EndTime
		Optional. Filter results on events which occured on or before EndTime (date and time)
	.PARAMETER LevelCritical
		Optional. Filter results on Level = Critical. Level parameters can be combined.
	.PARAMETER LevelError
		Optional. Filter results on Level = Error. Level parameters can be combined.
	.PARAMETER LevelWarning
		Optional. Filter results on Level = Warning. Level parameters can be combined.
	.PARAMETER LevelInfo
		Optional. Filter results on Level = Information. Level parameters can be combined.
	.PARAMETER LevelVerbose
		Optional. Filter results on Level = Verbose. Level parameters can be combined.
	.EXAMPLE
		Get-WindowsEvent -LogName System -Id 114 -Source "Microsoft-Windows-HttpService" -StartTime "10/20/2023 1:00 PM"

		Returns System event log items with ID=114 for Source (ProviderName)=Microsoft-Windows-HttpService 
		which occurred on or after 10/20/2023 at 1:00 PM local time
	.EXAMPLE
		Get-WindowsEvent -LogName System -Id "113,114" -Source "Microsoft-Windows-HttpService" -LevelCritical -LevelError -LevelWarning

		Returns System event log items with ID=113 or ID=114 for Source Microsoft-Windows-HttpService which
		are Level 1,2, or 3 (Critical, Error or Warning)
	.NOTES
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WindowsEvent.md
	#>
	[CmdletBinding()]
	param (
		[parameter()][string]$LogName = 'System',
		[parameter()][string]$Id,
		[parameter()][string]$Source,
		[parameter()][datetime]$StartTime,
		[parameter()][datetime]$EndTime,
		[parameter()][switch]$LevelCritical,
		[parameter()][switch]$LevelError,
		[parameter()][switch]$LevelWarning,
		[parameter()][switch]$LevelInfo,
		[parameter()][switch]$LevelVerbose
	)
	try {
		if ($PSVersionTable.Platform -eq 'Unix') { throw "This command only works on Windows" }
		$query = @"
<QueryList>
	<Query Id="0" Path="$LogName">
		<Select Path="$LogName">*</Select>
	</Query>
</QueryList>
"@
		$events = Get-WinEvent -LogName $LogName -FilterXPath $query -ErrorAction Stop
		$filter = @()
		$levels = @()
		$levs   = @()
		if (![string]::IsNullOrWhiteSpace($Id)) {
			$events = $events | Where-Object {$_.Id -in $($Id -split ',')}
		}
		if (![string]::IsNullOrWhiteSpace($Source)) {
			$events = $events | Where-Object {$_.ProviderName -eq $Source}
			$filter += "[ProviderName -eq $Source]"
		}
		if (![string]::IsNullOrWhiteSpace($StartTime)) {
			$events = $events | Where-Object {$_.TimeCreated -ge $StartTime}
			$filter += "[StartTime -ge $StartTime]"
		}
		if (![string]::IsNullOrWhiteSpace($EndTime)) {
			$events = $events | Where-Object {$_.TimeCreated -le $EndTime}
			$filter += "[EndTime -le $EndTime]"
		}
		if ($LevelCritical) {
			#$events = $events | Where-Object {$_.Level -eq 1}
			$levs += 1
			$levels += "Critical"
		}
		if ($LevelError) {
			#$events = $events | Where-Object {$_.Level -eq 2}
			$levs += 2
			$levels += "Error"
		}
		if ($LevelWarning) {
			#$events = $events | Where-Object {$_.Level -eq 3}
			$levs += 3
			$levels += "Warning"
		}
		if ($LevelInfo) {
			#$events = $events | Where-Object {$_.Level -in (0,4)}
			$levs += (0,4)
			$levels += "Information"
		}
		if ($LevelVerbose) {
			#$events = $events | Where-Object {$_.Level -eq 5}
			$levs += 5
			$levels += "Verbose"
		}
		if ($levels.Count -gt 0) {
			$events = $events | Where-Object {$_.Level -in $levs}
			$filter += "[Level -in ($($levels -join ','))]"
		}
		Write-Host "filter: $($filter -join ' ')" -ForegroundColor Cyan
		$events
	} catch {
		Write-Error $_.Exception.Message
	}
}