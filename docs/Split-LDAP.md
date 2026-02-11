---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Split-LDAP.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Split-LDAP
---

# Split-LDAP

## SYNOPSIS

Split LDAP path string

## SYNTAX

### __AllParameterSets

```
Split-LDAP [-Path] <string> [[-Delimiter] <string>] [[-Part] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Split LDAP path string like Split-Path, to return the root path of
and LDAP object DistinguishedName, or the Domain suffix portion.

## EXAMPLES

### EXAMPLE 1

$p1 = "CN=JSmith,CN=Users,DC=east,DC=contoso,DC=local"
Split-LDAP $p1
Returns "CN-Users,DC=east,DC=contoso,DC=local"

### EXAMPLE 2

$p1 = "CN=JSmith,CN=Users,DC=east,DC=contoso,DC=local"
Split-LDAP $p1 -Part Domain
Returns "DC=east,DC=contoso,DC=local"

### EXAMPLE 3

"CN=JSmith,CN=Users,DC=east,DC=contoso,DC=local" | Split-LDAP
Applies the split using pipeline input to return:
"CN=Users,DC=east,DC=contoso,DC=local"

## PARAMETERS

### -Delimiter

The character to apply the split upon.
The defaul is a comma (,)

```yaml
Type: System.String
DefaultValue: ','
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

### -Part

* Parent = return the root path portion
* Domain = return the domain suffix portion

```yaml
Type: System.String
DefaultValue: Parent
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 2
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Path

The LDAP object DistinguishedName

```yaml
Type: System.String
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

### System.String

{{ Fill in the Description }}

## OUTPUTS

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Split-LDAP.md)
