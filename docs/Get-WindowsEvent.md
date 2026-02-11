---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WindowsEvent.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Get-WindowsEvent
---

# Get-WindowsEvent

## SYNOPSIS

Get Windows Event log items.

## SYNTAX

### __AllParameterSets

```
Get-WindowsEvent [[-LogName] <string>] [[-Id] <string>] [[-Source] <string>]
 [[-StartTime] <datetime>] [[-EndTime] <datetime>] [-LevelCritical] [-LevelError] [-LevelWarning]
 [-LevelInfo] [-LevelVerbose] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get Windows Event log items based on flexible search parameters.

## EXAMPLES

### EXAMPLE 1

Get-WindowsEvent -LogName System -Id 114 -Source "Microsoft-Windows-HttpService" -StartTime "10/20/2023 1:00 PM"

Returns System event log items with ID=114 for Source (ProviderName)=Microsoft-Windows-HttpService 
which occurred on or after 10/20/2023 at 1:00 PM local time

### EXAMPLE 2

Get-WindowsEvent -LogName System -Id "113,114" -Source "Microsoft-Windows-HttpService" -LevelCritical -LevelError -LevelWarning

Returns System event log items with ID=113 or ID=114 for Source Microsoft-Windows-HttpService which
are Level 1,2, or 3 (Critical, Error or Warning)

## PARAMETERS

### -EndTime

Optional.
Filter results on events which occured on or before EndTime (date and time)

```yaml
Type: System.DateTime
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 4
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Id

Optional.
One or more Event ID numbers.
Separate multiple numbers with a comma.
Example: -Id 114
Example: -Id "113,114"

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -LevelCritical

Optional.
Filter results on Level = Critical.
Level parameters can be combined.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -LevelError

Optional.
Filter results on Level = Error.
Level parameters can be combined.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -LevelInfo

Optional.
Filter results on Level = Information.
Level parameters can be combined.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -LevelVerbose

Optional.
Filter results on Level = Verbose.
Level parameters can be combined.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -LevelWarning

Optional.
Filter results on Level = Warning.
Level parameters can be combined.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -LogName

Name of log.
Default = System

```yaml
Type: System.String
DefaultValue: System
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

### -Source

Optional.
Windows Event provider name, such as "Microsoft-Windows-HttpService" (aka "HttpService")

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 2
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -StartTime

Optional.
Filter results on events which occured on or after StartTime (date and time)

```yaml
Type: System.DateTime
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 3
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

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WindowsEvent.md)
