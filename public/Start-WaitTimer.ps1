function Start-WaitTimer {
	<#
	.SYNOPSIS
		Displays a progress bar while waiting for a specified amount of time.
	.DESCRIPTION
		Displays a progress bar while waiting for a specified amount of time.
	.PARAMETER TotalTime
		The total amount of time to wait in seconds. Default is 300 seconds (5 minutes).
	.PARAMETER Increment
		The amount of time to wait between progress updates in seconds. Default is 5 seconds.
	.PARAMETER Message
		The message to display while waiting. Default is "Waiting".
	.PARAMETER NoProgress
		Suppresses the progress bar and displays a simple message instead. Useful when running in a non-interactive environment.
		This parameter is ignored on Linux.
	.EXAMPLE
		Start-WaitTimer
		Displays a progress bar for 5 minutes with "Waiting..." as the message
	.EXAMPLE
		Start-WaitTimer -TotalTime 600 -Increment 10
		Displays a progress bar for 10 minutes.
	.EXAMPLE
		Start-WaitTimer -TotalTime 300 -Increment 5 -NoProgress
		Displays a simple message for 5 minutes.
	.EXAMPLE
		Start-WaitTimer -TotalTime 300 -Increment 5 -Message "Downloading"
		Displays a progress bar with a custom message for 5 minutes.
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Start-WaitTimer.md
	#>
	param (
		[parameter()][int]$TotalTime = 300,
		[parameter()][int]$Increment = 5,
		[parameter()][string]$Message = "Waiting",
		[parameter()][switch]$NoProgress
	)
	for ($i = 0; $i -lt $totalTime; $i+= $increment) {
		if (-not $NoProgress.IsPresent -and (-not $IsLinux)) {
			Write-Progress -Activity "$($Message)" -Status "$( [math]::Round(($totalTime - $i)/60,2) ) minutes remaining..." -PercentComplete ($i/$totalTime*100)
		} else {
			Write-Host "$($Message): $([math]::Round(($totalTime - $i)/60,2)) minutes remaining... (press Ctrl+C to cancel)..."
		}
		Start-Sleep -Seconds $increment
	}
}