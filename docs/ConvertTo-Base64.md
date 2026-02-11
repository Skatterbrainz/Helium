---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-Base64.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: ConvertTo-Base64
---

# ConvertTo-Base64

## SYNOPSIS

Convert ASCII or Unicode string to Base64

## SYNTAX

### __AllParameterSets

```
ConvertTo-Base64 [-String] <Object> [-Compressed] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Convert ASCII or Unicode string to Base64 string

## EXAMPLES

### EXAMPLE 1

$x = "this is a test string"
$x | ConvertTo-Base64
Returns: "H4sIAAAAAAAEACvJyCxWAKJEhZLU4hKF4pKizLx0ALXWhvwVAAAA"

### EXAMPLE 2

"this is a compressed test string" | ConvertTo-Base64 -Compressed
returns: "H4sIAAAAAAAACivJyCxWAKJEheT83IKi1OLi1BSFktTiEoXikqLMvHQAhzKd/iAAAAA="

## PARAMETERS

### -Compressed

Optional.
Compress results, or decode from compressed source

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
ASCII or Unicode string value to be converted.

```yaml
Type: System.Object
DefaultValue: ''
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

### System.Object

{{ Fill in the Description }}

## OUTPUTS

## NOTES

Compressed may result in a longer Base64 output.


## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-Base64.md)
