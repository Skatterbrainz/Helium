---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-DefaultAppAssociations.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Get-DefaultAppAssociations
---

# Get-DefaultAppAssociations

## SYNOPSIS

Get Windows default app associations table

## SYNTAX

### __AllParameterSets

```
Get-DefaultAppAssociations [[-FilePath] <string>] [[-RefreshDays] <int>] [-Force]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Returns default app associations for the current user, saves to a file, and reuses the file for a specified number of days.

## EXAMPLES

### EXAMPLE 1

Get-DefaultAppAssociations

### EXAMPLE 2

Get-DefaultAppAssociations -Force

## PARAMETERS

### -FilePath

Path where export file is saved/maintained.
Default path is user Documents path.
Default filename is defaultapps.xml.
For example: $($env:USERPROFILE)\Documents\defaultapps.xml

```yaml
Type: System.String
DefaultValue: '"$($env:HOME)\documents\defaultapps.xml"'
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

### -Force

Force a refresh of the export file

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

### -RefreshDays

Number of days to reuse export file until forcing a refresh.
The default value is 7 (days)

```yaml
Type: System.Int32
DefaultValue: 7
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-DefaultAppAssociations.md)
