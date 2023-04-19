function Write-WindowsEvent {
	<#
	.SYNOPSIS
		Workaround for Write-EventLog where -Source often pisses me off
	.DESCRIPTION
		I'm still pissed. I mean,seriously, too busy? More things to rename to Defender something something?
	.PARAMETER LogName
		For now: System or Application. That's it. I'm cheap.
	.PARAMETER EventID
		You guessed it: The event ID number. The default is 1. The value must be within the
		range of 1 to 16,384.
	.PARAMETER Category
		I really don't care about Category, but it's whatever you want (within allowances)
	.PARAMETER Severity
		For now: Information,Warning or Error. The default is Information
	.PARAMETER Source
		And now, for the main event: The event source name. The docs (as of 3/27/2023) show examples that
		clearly imply you can provide any custom name you desire. They show "MyApp". But if you try that
		you'll get punched in the face with an annoying message something like:

		```Write-EventLog : The source name "MyApp" does not exist on computer "localhost"```

		* So I inserted my bite guard and strapped on the head gear and took the face hit for you.
		* Source: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/write-eventlog?view=powershell-5.1
	.PARAMETER Message
		Say something. I don't care. You can say 'Hello world!' if it makes you happy.
	.EXAMPLE
		Write-WindowsEvent -EventID 101 -Source "SCORCH" -Message "Runbook FUBAR-TARFU state: Stopped" -Severity "Warning"
	.LINK
		#
	#>
	param (
		[parameter()][string][ValidateSet('System','Application')]$LogName = "Application",
		[parameter()][int][ValidateRange(1,16384)]$EventID = 1,
		[parameter()][int]$Category = 1,
		[parameter()][string][ValidateSet('Information','Warning','Error')]$Severity = 'Information',
		[parameter()][string]$ComputerName = $env:COMPUTERNAME,
		[parameter(Mandatory)][string][ValidateNotNullOrEmpty()]$Source,
		[parameter(Mandatory)][string][ValidateNotNullOrEmpty()]$Message
	)
	$sourceExists = (Get-WmiObject -Class Win32_NTEventLOgFile |
		Select-Object FileName, Sources |
			ForEach-Object -Begin { $hash = @{}} -Process { $hash[$_.FileName] = $_.Sources } -End { $Hash })["Application"] | findstr $Source
	if (-not $SourceExists) {
		$null = New-EventLog -LogName Application -Source $Source
	}
	Write-EventLog -ComputerName $ComputerName -LogName $LogName -Source $Source -EventID $EventID -Message $Message -Category $Category -EntryType $Severity
}
