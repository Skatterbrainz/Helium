---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-UpTime.md
schema: 2.0.0
---

# Get-UpTime

## SYNOPSIS
Get system uptime

## SYNTAX

```
Get-UpTime [[-ComputerName] <String>] [[-Credential] <PSCredential>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get system uptime (time since last restart)

## EXAMPLES

### EXAMPLE 1
```
Get-UpTime
```

### EXAMPLE 2
```
Get-UpTime -ComputerName Server123
```

### EXAMPLE 3
```
Get-UpTime -ComputerName Server123 -Credential $myCred
```

## PARAMETERS

### -ComputerName
Optional.
Name of remote computer to query

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
Optional.
Credential to use for remote connection when using -ComputerName

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.TimeSpan
### System.DateTime
## NOTES

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-UpTime.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-UpTime.md)

[https://go.microsoft.com/fwlink/?linkid=834862](https://go.microsoft.com/fwlink/?linkid=834862)

