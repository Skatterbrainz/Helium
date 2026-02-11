---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-Calendar.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Get-Calendar
---

# Get-Calendar

## SYNOPSIS

Display a calendar.

## SYNTAX

### __AllParameterSets

```
Get-Calendar [[-Date] <datetime>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Display a calendar for the current month or a specified date/month.

## EXAMPLES

### EXAMPLE 1

Get-Calendar
Display the calendar for the current month.

### EXAMPLE 2

Get-Calendar -Date "2024-08-26"
Display the calendar for August 2024.

## PARAMETERS

### -Date

The date to display the calendar for.
If not specified, the current date is used.

```yaml
Type: System.DateTime
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-Calendar.md)
