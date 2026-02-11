---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-RoundedInteger.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Get-RoundedInteger
---

# Get-RoundedInteger

## SYNOPSIS

Get rounded integer to nearest base or floor number

## SYNTAX

### __AllParameterSets

```
Get-RoundedInteger [-Integer] <int> [[-Nearest] <int>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Round integer number to nearest BASE value (e.g.
10, 100, 1000)
Note this is NOT a standard Round operation.
A standard Round of 1055 to the nearest 100 would result in 1100
	[math]::Round(1055 / 100) * 100 = 1100
This round uses the nearest base or floor
	Get-RoundedInteger 1055 100 = 1000

## EXAMPLES

### EXAMPLE 1

Get-RoundedInteger -Integer 124 -Nearest 10
Returns 120

### EXAMPLE 2

Get-RoundedInteger -Integer 1123 -Nearest 100
Returns 1100

## PARAMETERS

### -Integer

Required.
Integer value to apply rounding

```yaml
Type: System.Int32
DefaultValue: 0
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

### -Nearest

Optional.
Nearest precision to round [Integer] to.
Default is 100

```yaml
Type: System.Int32
DefaultValue: 100
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

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-RoundedInteger.md)
