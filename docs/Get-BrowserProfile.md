---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-BrowserProfile.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Get-BrowserProfile
---

# Get-BrowserProfile

## SYNOPSIS

Query Browser Profiles

## SYNTAX

### __AllParameterSets

```
Get-BrowserProfile [-Browser] <string> [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Query Browser profiles, returning ID, Name and UserName.
For current user or all users

## EXAMPLES

### EXAMPLE 1

Get-BrowserProfile -Browser Edge

Returns all profiles for the Edge browser

### EXAMPLE 2

Get-BrowserProfile -Browser Chrome

Returns all profiles for the Chrome browser

## PARAMETERS

### -Browser

Optional.
Browser app to target for query (if installed)
* Chrome
* Edge
* Brave
* Firefox

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

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-BrowserProfile.md)
