---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WLANProfile.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Get-WLANProfile
---

# Get-WLANProfile

## SYNOPSIS

Get Wireless profile names and passwords.

## SYNTAX

### __AllParameterSets

```
Get-WLANProfile [[-Name] <string>] [-ClearText] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get Wireless connection profile names and passwords.
Same as using: netsh wlan show profiles

## EXAMPLES

### EXAMPLE 1

Get-WLANProfile

Returns all WLAN profiles with encrypted passwords.

### EXAMPLE 2

Get-WLANProfile -Name Home123

Returns WLAN profile Home123 and its encrypted password.

### EXAMPLE 3

Get-WLANProfile -Name Home123 -ClearText

Returns WLAN profile Home123 and its password in clear text.

## PARAMETERS

### -ClearText

Optional.
Return passwords in clear text.
Default is to return as secure string values.

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

### -Name

Optional.
Name of WLAN profile to query.
Default (blank) returns all WLAN profiles.

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

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WLANProfile.md)
