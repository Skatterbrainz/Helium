function Clear-IISLogs {
	<#
	.SYNOPSIS
		Remove IIS log files older than a specified number of days
	.DESCRIPTION
		Remove IIS log files older than a specified number of days
	.PARAMETER LogPath
		IIS log folder path. Default is "c:\inetpub\logs"
	.PARAMETER DaysToKeep
		How many days of log files to retain. Default is 30 days.
	.PARAMETER TransactionLog
		Output transaction log. Default is "c:\windows\temp\cleanup_old_iislogs.log"
	.EXAMPLE
		Clear-IISLogs -LogPath "c:\inetpub\logs" -DaysToKeep 30 -TransactionLog "c:\windows\temp\cleanup_old_iislogs.log"
		Remove IIS log files older than 30 days from c:\inetpub\logs and log the transaction to c:\windows\temp\cleanup_old_iislogs.log
	.EXAMPLE
		Clear-IISLogs
		Remove IIS log files older than 30 days from c:\inetpub\logs and log the transaction to c:\windows\temp\cleanup_old_iislogs.logs
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Clear-IISLogs.md
	#>
	[CmdletBinding(SupportsShouldProcess = $True)]
	param (
		[parameter(Mandatory = $False, HelpMessage = "IIS log folder path")]
		[ValidateNotNullOrEmpty()]
		[string] $LogPath = "c:\inetpub\logs",
		[parameter(Mandatory = $False, HelpMessage = "How many days of log files to retain")]
		[ValidateNotNullOrEmpty()]
		[ValidateRange(1, 366)]
		[int] $DaysToKeep = 30,
		[parameter(Mandatory = $False, HelpMessage = "Output transaction log")]
		[ValidateNotNullOrEmpty()]
		[string] $TransactionLog = "c:\windows\temp\cleanup_old_iislogs.log"
	)
	if (!$IsWindows) {
		Write-Warning "This script is designed to run on Windows only."
		break
	}
	$OldFiles = Get-ChildItem $LogPath -Recurse -File *.log | Where-Object { $_.LastWriteTime -lt ((Get-Date).AddDays(-$DaysToKeep)) }
	if ($OldFiles.Count -gt 0) {
		foreach ($file in $OldFiles) {
			"$($file.BaseName) is older than $((Get-Date).AddDays(-$DaysToKeep)) and will be deleted" | Add-Content $TransactionLog
			Get-Item $file | Remove-Item -Verbose
		}
	} else {
		"No items to be deleted on $($(Get-Date).DateTime)" | Add-Content $TransactionLog
	}
	Write-Output "cleanup of log files older than $((Get-Date).AddDays(-$DaysToKeep)) completed."

}