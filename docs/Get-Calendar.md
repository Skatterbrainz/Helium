---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-Calendar.md
schema: 2.0.0
---

# Get-Calendar

## SYNOPSIS
Display a calendar.

## SYNTAX

```
Get-Calendar [[-Date] <DateTime>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Display a calendar for the current month or a specified date/month.

## EXAMPLES

### EXAMPLE 1
```
Get-Calendar
Display the calendar for the current month.
```

### EXAMPLE 2
```
Get-Calendar -Date "2024-08-26"
Display the calendar for August 2024.
```

## PARAMETERS

### -Date
The date to display the calendar for.
If not specified, the current date is used.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-Calendar.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-Calendar.md)

