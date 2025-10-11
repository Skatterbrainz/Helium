---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-LocalGroupMembers.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Get-LocalGroupMembers
---

# Get-LocalGroupMembers

## SYNOPSIS

Returns local group members

## SYNTAX

### __AllParameterSets

```
Get-LocalGroupMembers [[-ComputerName] <string>] [[-Identity] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Returns local group members

## EXAMPLES

## PARAMETERS

### -ComputerName

Name of computer (if remote).
Default = 'localhost'

```yaml
Type: System.String
DefaultValue: localhost
SupportsWildcards: false
Aliases:
- Name
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Identity

Name of local group.
Default = 'Administrators'

```yaml
Type: System.String
DefaultValue: Administrators
SupportsWildcards: false
Aliases:
- Group
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

### System.String

{{ Fill in the Description }}

## OUTPUTS

## NOTES

Adapted from https://gallery.technet.microsoft.com/scriptcenter/List-local-group-members-c25dbcc4


## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-LocalGroupMembers.md)
