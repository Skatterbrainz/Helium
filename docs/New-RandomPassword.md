---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/New-RandomPassword.md
Locale: en-US
Module Name: helium
ms.date: 05/11/2026
PlatyPS schema version: 2024-05-01
title: New-RandomPassword
---

# New-RandomPassword

## SYNOPSIS

Creates a new random password.

## SYNTAX

### __AllParameterSets

```
New-RandomPassword [[-pwdLength] <Int32>] [-Strong] [-useCapitals] [-useNumbers] [-useSymbols]
 [-pwdCount <Int32>] [-OutputFormat <String>] [-BaseURL <String>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Generates a random password using the DinoPass API.

## EXAMPLES

### EXAMPLE 1

New-RandomPassword -pwdLength 12 -useCapitals -useNumbers

Generates a 12-character random password with capital letters and numbers.

### EXAMPLE 2

New-RandomPassword -Strong

Generates a strong random password using the DinoPass strong endpoint.

### EXAMPLE 3

New-RandomPassword -pwdCount 5 -OutputFormat json

Generates 5 random passwords and outputs them in JSON format.

### EXAMPLE 4

New-RandomPassword -pwdLength 20 -useCapitals -useNumbers -useSymbols

Generates a 20-character random password with capital letters, numbers, and symbols.

## PARAMETERS

### -pwdLength

Optional.
Length of the password. Must be between 7 and 20.

```yaml
Type: System.Int32
DefaultValue: 16
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

### -Strong

Optional.
If specified, generates a strong password.

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

### -useCapitals

Optional.
If specified, includes capital letters in custom password mode.

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

### -useNumbers

Optional.
If specified, includes numbers in custom password mode.

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

### -useSymbols

Optional.
If specified, includes symbols in custom password mode.

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

### -pwdCount

Optional.
Number of passwords to generate.

```yaml
Type: System.Int32
DefaultValue: 1
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

### -OutputFormat

Optional.
Output format. Valid values are `text` and `json`.

```yaml
Type: System.String
DefaultValue: 'text'
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
AcceptedValues: [text, json]
HelpMessage: ''
```

### -BaseURL

Optional.
Base URL of the DinoPass API endpoint.

```yaml
Type: System.String
DefaultValue: 'http://www.dinopass.com/password'
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String

Returns the generated password content.

### System.Object

When `-OutputFormat json` is used, returns JSON content from the API.

## NOTES

See API reference at https://www.dinopass.com/api for more information.

## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/New-RandomPassword.md)
