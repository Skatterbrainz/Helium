---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Join-Url.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Join-Url
---

# Join-Url

## SYNOPSIS

Join-Path for WEB URL strings

## SYNTAX

### __AllParameterSets

```
Join-Url [-Path] <string> [-ChildPath] <string> [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Join-Path for WEB URL strings

## EXAMPLES

### EXAMPLE 1

Join-Url -Path "https://www.contoso.com" -ChildPath "sales"
returns "https://www.contoso.com/sales"

### EXAMPLE 2

Join-Url -Path "https://www.contoso.com/sales/" -ChildPath "accounts"
returns "https://www.contoso.com/sales/accounts"

## PARAMETERS

### -ChildPath

Child path string to append to Path

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Path

Base path string

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

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Join-Url.md)
