---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WindowsEvent.md
schema: 2.0.0
---

# Get-WindowsEvent

## SYNOPSIS
Get Windows Event log items.

## SYNTAX

```
Get-WindowsEvent [[-LogName] <String>] [[-Id] <String>] [[-Source] <String>] [[-StartTime] <DateTime>]
 [[-EndTime] <DateTime>] [-LevelCritical] [-LevelError] [-LevelWarning] [-LevelInfo] [-LevelVerbose]
 [<CommonParameters>]
```

## DESCRIPTION
Get Windows Event log items based on flexible search parameters.

## EXAMPLES

### EXAMPLE 1
```
Get-WindowsEvent -LogName System -Id 114 -Source "Microsoft-Windows-HttpService" -StartTime "10/20/2023 1:00 PM"
```

Returns System event log items with ID=114 for Source (ProviderName)=Microsoft-Windows-HttpService 
which occurred on or after 10/20/2023 at 1:00 PM local time

### EXAMPLE 2
```
Get-WindowsEvent -LogName System -Id "113,114" -Source "Microsoft-Windows-HttpService" -LevelCritical -LevelError -LevelWarning
```

Returns System event log items with ID=113 or ID=114 for Source Microsoft-Windows-HttpService which
are Level 1,2, or 3 (Critical, Error or Warning)

## PARAMETERS

### -LogName
Name of log.
Default = System

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: System
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
Optional.
One or more Event ID numbers.
Separate multiple numbers with a comma.
Example: -Id 114
Example: -Id "113,114"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Source
Optional.
Windows Event provider name, such as "Microsoft-Windows-HttpService" (aka "HttpService")

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartTime
Optional.
Filter results on events which occured on or after StartTime (date and time)

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EndTime
Optional.
Filter results on events which occured on or before EndTime (date and time)

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LevelCritical
Optional.
Filter results on Level = Critical.
Level parameters can be combined.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LevelError
Optional.
Filter results on Level = Error.
Level parameters can be combined.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LevelWarning
Optional.
Filter results on Level = Warning.
Level parameters can be combined.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LevelInfo
Optional.
Filter results on Level = Information.
Level parameters can be combined.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LevelVerbose
Optional.
Filter results on Level = Verbose.
Level parameters can be combined.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WindowsEvent.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WindowsEvent.md)

