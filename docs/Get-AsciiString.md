---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-CleanString.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Get-AsciiString
---

# Get-AsciiString

## SYNOPSIS

Trim leading and trailing spaces from string, and optionally replace non-ASCII characters

## SYNTAX

### __AllParameterSets

```
Get-AsciiString [[-String] <string>] [-Cleanup] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Trim leading and trailing spaces from string, and optionally replace non-ASCII characters
such as diacritic characters with corresponding ASCII characters

## EXAMPLES

### EXAMPLE 1

Get-AsciiString 'diakritikós '

returns 'diakritikós' (trailing space removed)

### EXAMPLE 2

Get-AsciiString 'diakritikós ' -Cleanup

returns 'diakritikos' (trailing space removed, and ó is replace with o)

## PARAMETERS

### -Cleanup

Optional.
Replace diacritic characters with ASCII characters

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

### -String

Required.
String value to be trimmed and cleaned.

```yaml
Type: System.String
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

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-CleanString.md)
