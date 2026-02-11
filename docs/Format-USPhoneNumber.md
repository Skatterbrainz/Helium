---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: ''
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Format-USPhoneNumber
---

# Format-USPhoneNumber

## SYNOPSIS

Formats a phone number to the standard format (XXX) XXX-XXXX or +1 (XXX) XXX-XXXX.

## SYNTAX

### __AllParameterSets

```
Format-USPhoneNumber [-PhoneNumber] <string> [[-CountrCode] <int>] [-includeCountryCode]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Formats a phone number to a standard format.
The function accepts a phone number in various formats and returns the phone number in the format (XXX) XXX-XXXX.
The function also accepts a switch parameter to include the country code.

## EXAMPLES

### EXAMPLE 1

Format-USPhoneNumber -PhoneNumber "1234567890" -includeCountryCode
Formats the phone number 1234567890 to (123) 456-7890 with the country code +1.

### EXAMPLE 2

Format-USPhoneNumber -PhoneNumber "123 456 7890" -includeCountryCode
Formats the phone number 123 456 7890 to (123) 456-7890 with the country code +1.

### EXAMPLE 3

Format-USPhoneNumber -PhoneNumber "123-456-7890" -includeCountryCode
Formats the phone number 123-456-7890 to (123) 456-7890 with the country code +1.

### EXAMPLE 4

Format-USPhoneNumber -PhoneNumber "(123) 456-7890" -includeCountryCode
Formats the phone number (123) 456-7890 to (123) 456-7890 with the country code +1.

### EXAMPLE 5

Format-USPhoneNumber -PhoneNumber "(123)-456-7890" -includeCountryCode
Formats the phone number (123)-456-7890 to (123) 456-7890 with the country code +1.

### EXAMPLE 6

Format-USPhoneNumber -PhoneNumber "123-456-7890" -includeCountryCode
Formats the phone number 123-456-7890 to (123) 456-7890 with the country code +1.

### EXAMPLE 7

Format-USPhoneNumber -PhoneNumber "123.456.7890" -includeCountryCode
Formats the phone number 123.456.7890 to (123) 456-7890 with the country code +1.

## PARAMETERS

### -CountrCode

{{ Fill CountrCode Description }}

```yaml
Type: System.Int32
DefaultValue: 1
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

### -includeCountryCode

A switch parameter to include the country code in the formatted phone number.

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

### -PhoneNumber

The phone number to format.
The phone number can be in the following formats:
- 1234567890
- 123 456 7890
- 123-456-7890
- (123) 456-7890
- (123)-456-7890
- 123-456-7890
- 123.456.7890

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

- []()
