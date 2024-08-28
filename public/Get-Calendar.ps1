function Get-Calendar {
	<#
	.SYNOPSIS
		Display a calendar.
	.DESCRIPTION
		Display a calendar for the current month or a specified date/month.
	.PARAMETER Date
		The date to display the calendar for. If not specified, the current date is used.
	.EXAMPLE
		Get-Calendar
		Display the calendar for the current month.
	.EXAMPLE
		Get-Calendar -Date "2024-08-26"
		Display the calendar for August 2024.
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-Calendar.md
	#>
	param (
		[parameter()][datetime]$Date
	)
	# Get the current date
	if ($Date) {
		$currentDate = $Date
	} else {
		$currentDate = Get-Date
	}
	$firstDay = Get-Date -Year $currentDate.Year -Month $currentDate.Month -Day 1
	$lastDay = $firstDay.AddMonths(1).AddDays(-1)
	Write-Host ("{0} - {1}" -f $firstDay.ToString("MMMM"), $firstDay.Year) -ForegroundColor Cyan
	"Su Mo Tu We Th Fr Sa" | Write-Host
	$startDay = [int]$firstDay.DayOfWeek
	$calendarRow = " " * ($startDay * 3)
	for ($day = 1; $day -le $lastDay.Day; $day++) {
		$calendarRow += "{0,2} " -f $day
		if (($startDay + $day) % 7 -eq 0) {
			Write-Host $calendarRow
			$calendarRow = ""
		}
	}
	if ($calendarRow) {
		Write-Host $calendarRow
	}
}