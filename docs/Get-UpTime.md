---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-UpTime.md
schema: 2.0.0
---

# Get-UpTime

## SYNOPSIS
Get system uptime

Get the TimeSpan since last boot.

## SYNTAX

```
Get-UpTime [[-ComputerName] <String>] [[-Credential] <PSCredential>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get system uptime (time since last restart)

This cmdlet returns the time elapsed since the last boot of the operating system.

The \`Get-Uptime\` cmdlet was introduced in PowerShell 6.0.

## EXAMPLES

### EXAMPLE 1
```
Get-UpTime
```

### EXAMPLE 2
```
Get-UpTime -ComputerName Server123
```

### EXAMPLE 3
```
Get-UpTime -ComputerName Server123 -Credential $myCred
```

### Example 1 - Show time since last boot
```
Get-Uptime

Days              : 9
Hours             : 0
Minutes           : 9
Seconds           : 45
Milliseconds      : 0
Ticks             : 7781850000000
TotalDays         : 9.00677083333333
TotalHours        : 216.1625
TotalMinutes      : 12969.75
TotalSeconds      : 778185
TotalMilliseconds : 778185000
```

### Example 2 - Show the time of the last boot
```
Get-Uptime -Since

Tuesday, June 18, 2019 2:34:56 PM
```

## PARAMETERS

### -ComputerName
Optional.
Name of remote computer to query

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
Optional.
Credential to use for remote connection when using -ComputerName

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
You can't pipe objects to this cmdlet.

## OUTPUTS

### System.TimeSpan
By default, this cmdlet returns a TimeSpan object representing the elapsed time.

### System.DateTime
When you use the Since parameter, this cmdlet returns a DateTime object representing the last boot time.

\> \[!NOTE\] \> If Windows fast startup is enabled, Windows does not update the value stored in \> LastBootUpTime .
To disable fast startup, run the following command: \`Powercfg -h off\`.
\> \> For more information about Windows fast startup, see \> Distinguishing Fast Startup from Wake-from-Hibernation (/windows-hardware/drivers/kernel/distinguishing-fast-startup-from-wake-from-hibernation).

## NOTES
On Windows, the value returned is the same as the LastBootUpTime property of the Win32_OperatingSystem class in WMI.

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-UpTime.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-UpTime.md)

[Online Version:](https://learn.microsoft.com/powershell/module/microsoft.powershell.utility/get-uptime?view=powershell-7.3&WT.mc_id=ps-gethelp)

[Win32_OperatingSystem]()

