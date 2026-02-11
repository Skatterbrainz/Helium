---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ReverseDistinguishedName.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Get-ReverseDistinguishedName
---

# Get-ReverseDistinguishedName

## SYNOPSIS

Reverse an LDAP DistinguishedName into ADSI form

## SYNTAX

### __AllParameterSets

```
Get-ReverseDistinguishedName [-DistinguishedName] <string> [-PathOnly] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Reverse an LDAP DistinguishedName value into ADSI form so that it 
reads left-to-right Domain,Path,Name without the prefix keys (e.g.
"OU=")

## EXAMPLES

### EXAMPLE 1

Get-ReverseDistinguishedName "CN=TaylorS,OU=Users,OU=Sales,OU=CORP,DC=East,DC=Contoso,DC=local"
Returns: "East.Contoso.local\CORP\Sales\UsersTaylorS"

### EXAMPLE 2

Get-ReverseDistinguishedName -PathOnly "CN=TaylorS,OU=Users,OU=Sales,OU=CORP,DC=East,DC=Contoso,DC=local"
Returns: "East.Contoso.local\CORP\Sales"

## PARAMETERS

### -DistinguishedName

LDAP DistinguishedName value

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

### -PathOnly

Optional.
Returns domain root and path without the object name (CN= value)

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ReverseDistinguishedName.md)
