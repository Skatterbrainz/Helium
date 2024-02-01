---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-LocalGroupMembers.md
schema: 2.0.0
---

# Get-LocalGroupMembers

## SYNOPSIS
Returns local group members

## SYNTAX

```
Get-LocalGroupMembers [[-ComputerName] <String>] [[-GroupName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns local group members

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -ComputerName
Name of computer (if remote).
Default = 'localhost'

```yaml
Type: String
Parameter Sets: (All)
Aliases: Name

Required: False
Position: 1
Default value: Localhost
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -GroupName
Name of local group.
Default = 'Administrators'

```yaml
Type: String
Parameter Sets: (All)
Aliases: Group

Required: False
Position: 2
Default value: Administrators
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Adapted from https://gallery.technet.microsoft.com/scriptcenter/List-local-group-members-c25dbcc4

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-LocalGroupMembers.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-LocalGroupMembers.md)

