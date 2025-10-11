---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-LoggedOnUsers.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Get-LoggedOnUser
---

# Get-LoggedOnUser

## SYNOPSIS

Get currently logged-on users

## SYNTAX

### __AllParameterSets

```
Get-LoggedOnUser [[-ComputerName] <string[]>] [-UserName <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

This will check the specified machine to see all users who are logged on.
For updated help and examples refer to -Online version.
This function was added to DS-UTILS but I did not write it (see below)

## EXAMPLES

### EXAMPLE 1

Get-LoggedOnUser -ComputerName Server01
Display all the users that are logged in server01

### EXAMPLE 2

Get-LoggedOnUser -ComputerName Server01, Server02 -UserName jsmith
Display if the user, jsmith, is logged into server01 and/or server02

## PARAMETERS

### -ComputerName

Specify a computername to see which users are logged into it.
 If no computers are specified, it will default to the local computer.

```yaml
Type: System.String[]
DefaultValue: $env:COMPUTERNAME
SupportsWildcards: false
Aliases: []
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

### -UserName

If the specified username is found logged into a machine, it will display it in the output.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases:
- SamAccountName
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

### System.String[]

{{ Fill in the Description }}

## OUTPUTS

## NOTES

Name: Get-LoggedInUser
Author: Paul Contreras
Version: 3.0
DateUpdated: 2021-Sep-21
https://thesysadminchannel.com/get-logged-in-users-using-powershell/ -
For updated help and examples refer to -Online version.


## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-LoggedOnUsers.md)
