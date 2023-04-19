---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-LoggedOnUsers.md
schema: 2.0.0
---

# Get-LoggedOnUser

## SYNOPSIS
This will check the specified machine to see all users who are logged on.
For updated help and examples refer to -Online version.
This function was added to DS-UTILS but I did not write it (see below)

## SYNTAX

```
Get-LoggedOnUser [[-ComputerName] <String[]>] [-UserName <String>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### EXAMPLE 1
```
Get-LoggedOnUser -ComputerName Server01
Display all the users that are logged in server01
```

### EXAMPLE 2
```
Get-LoggedOnUser -ComputerName Server01, Server02 -UserName jsmith
Display if the user, jsmith, is logged into server01 and/or server02
```

## PARAMETERS

### -ComputerName
Specify a computername to see which users are logged into it. 
If no computers are specified, it will default to the local computer.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: $env:COMPUTERNAME
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -UserName
If the specified username is found logged into a machine, it will display it in the output.

```yaml
Type: String
Parameter Sets: (All)
Aliases: SamAccountName

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Name: Get-LoggedInUser
Author: Paul Contreras
Version: 3.0
DateUpdated: 2021-Sep-21
https://thesysadminchannel.com/get-logged-in-users-using-powershell/ -
For updated help and examples refer to -Online version.

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-LoggedOnUsers.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-LoggedOnUsers.md)

