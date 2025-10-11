---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ReverseLDAP.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Get-ReverseLDAP
---

# Get-ReverseLDAP

## SYNOPSIS

Reverse LDAP path string to Domain\OU format

## SYNTAX

### __AllParameterSets

```
Get-ReverseLDAP [-Path] <string> [-RelativePath] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Reverse LDAP distinguishedName format order to result in a Domain\OU ordered
string value.

## EXAMPLES

### EXAMPLE 1

Get-ReverseLDAP -Path "CN=SmithJ,OU=Users,OU=Sales,OU=Departments,OU=CORP,DC=contoso,DC=local"

Returns: contoso.local\CORP\Departments\Sales\Users\SmithJ

### EXAMPLE 2

Get-ReverseLDAP -Path "CN=SmithJ,OU=Users,OU=Sales,OU=Departments,OU=CORP,DC=contoso,DC=local" -RelativePath

Returns: CORP\Departments\Sales\Users\SmithJ

## PARAMETERS

### -Path

LDAP path or DistinguishedName

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

### -RelativePath

Optional.
If present, excludes the DC portions of the path string.
See Example 2

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

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ReverseLDAP.md)
