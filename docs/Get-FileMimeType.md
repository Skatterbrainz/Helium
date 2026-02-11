---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-FileMimeType.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Get-FileMimeType
---

# Get-FileMimeType

## SYNOPSIS

Get the MIME type of a file.

## SYNTAX

### __AllParameterSets

```
Get-FileMimeType [-FilePath] <string> [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get the MIME type of a file.

## EXAMPLES

### EXAMPLE 1

Get-FileMimeType -FilePath "C:\Users\user\Downloads\file.txt"
PS C:\> Get-FileMimeType -FilePath "C:\Users\user\Downloads\file.txt"
PS C:\> text/plain

## PARAMETERS

### -FilePath

The path to the file

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
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

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-FileMimeType.md)
