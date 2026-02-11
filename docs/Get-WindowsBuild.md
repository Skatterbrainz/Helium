---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WindowsBuild.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Get-WindowsBuild
---

# Get-WindowsBuild

## SYNOPSIS

Returns list of Windows build numbers and versions. Optionally filter by build number.

## SYNTAX

### __AllParameterSets

```
Get-WindowsBuild [[-BuildNumber] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Returns list of Windows build numbers and versions.
Optionally filter by build number.

## EXAMPLES

### EXAMPLE 1

Get-WindowsBuild
Returns all Windows build numbers and versions.

### EXAMPLE 2

Get-WindowsBuild -BuildNumber 19041
Returns Windows build number 19041 and version (Windows 10 2004)

## PARAMETERS

### -BuildNumber

Filter by build number.
If omitted, returns all build numbers.

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

https://gist.github.com/Skatterbrainz/9306ed76f08fb7e6868b8b7a1fc544c5


## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WindowsBuild.md)
