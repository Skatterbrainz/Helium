---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-DecimalErrorCode.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: ConvertFrom-DecimalErrorCode
---

# ConvertFrom-DecimalErrorCode

## SYNOPSIS

Convert Decimal error code

## SYNTAX

### __AllParameterSets

```
ConvertFrom-DecimalErrorCode [-DecimalErrorCode] <long> [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Convert Decimal error code

## EXAMPLES

### EXAMPLE 1

-2147206582 | ConvertFrom-DecimalErrorCode
Returns: 0xffffffff80043a4a

## PARAMETERS

### -DecimalErrorCode

Error code in Decimal format

```yaml
Type: System.Int64
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
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

### System.Int64

{{ Fill in the Description }}

## OUTPUTS

## NOTES

By Trevor Jones - https://smsagent.blog/2015/06/25/translating-error-codes-for-windows-and-configuration-manager/


## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-DecimalErrorCode.md)
