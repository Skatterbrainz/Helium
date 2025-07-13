---
external help file: helium-help.xml
Module Name: helium
online version: http://blog.richprescott.com
schema: 2.0.0
---

# Get-CMLog

## SYNOPSIS
Parses logs for System Center Configuration Manager.

## SYNTAX

```
Get-CMLog [-Path] <Object> [-tail <Object>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Accepts a single log file or array of log files and parses them into objects.
Shows both UTC and local time for troubleshooting across time zones.

## EXAMPLES

### EXAMPLE 1
```
Get-CMLog -Path Sample.log
Converts each log line in Sample.log into objects
	UTCTime   : 7/15/2013 3:28:08 PM
	LocalTime : 7/15/2013 2:28:08 PM
	FileName  : sample.log
	Component : TSPxe
	Context   : 
	Type      : 3
	TID       : 1040
	Reference : libsmsmessaging.cpp:9281
	Message   : content location request failed
```

### EXAMPLE 2
```
Get-ChildItem -Path C:\Windows\CCM\Logs | Select-String -Pattern 'failed' | Select -Unique Path | Get-CMLog
Find all log files in folder, create a unique list of files containing the phrase 'failed, and convert the logs into objects
	UTCTime   : 7/15/2013 3:28:08 PM
	LocalTime : 7/15/2013 2:28:08 PM
	FileName  : sample.log
	Component : TSPxe
	Context   : 
	Type      : 3
	TID       : 1040
	Reference : libsmsmessaging.cpp:9281
	Message   : content location request failed
```

## PARAMETERS

### -Path
Specifies the path to a log file or files.

```yaml
Type: Object
Parameter Sets: (All)
Aliases: FullName

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -tail
{{ Fill tail Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 10
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

### Path/FullName.
## OUTPUTS

### PSCustomObject.
## NOTES

## RELATED LINKS

[http://blog.richprescott.com](http://blog.richprescott.com)

