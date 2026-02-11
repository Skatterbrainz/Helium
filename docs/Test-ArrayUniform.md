---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Test-ArrayUniform.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Test-ArrayUniform
---

# Test-ArrayUniform

## SYNOPSIS

Tests if all elements in an array are equal to a reference value

## SYNTAX

### __AllParameterSets

```
Test-ArrayUniform [[-Array] <array>] [[-ReferenceValue] <Object>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Tests if all elements in an array are equal to a reference value

## EXAMPLES

### EXAMPLE 1

Test-ArrayUniform -Array @('a','a','a') -ReferenceValue 'a'
returns True

### EXAMPLE 2

Test-ArrayUniform -Array @('a','b','a') -ReferenceValue 'a'
returns False

## PARAMETERS

### -Array

Array to test

```yaml
Type: System.Array
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

### -ReferenceValue

Reference value to test against

```yaml
Type: System.Object
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Test-ArrayUniform.md)
