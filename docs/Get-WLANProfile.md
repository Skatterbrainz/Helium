---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WLANProfile.md
schema: 2.0.0
---

# Get-WLANProfile

## SYNOPSIS
Get Wireless profile names and passwords.

## SYNTAX

```
Get-WLANProfile [[-Name] <String>] [-ClearText] [<CommonParameters>]
```

## DESCRIPTION
Get Wireless connection profile names and passwords.
Same as using: netsh wlan show profiles

## EXAMPLES

### EXAMPLE 1
```
Get-WLANProfile
```

Returns all WLAN profiles with encrypted passwords.

### EXAMPLE 2
```
Get-WLANProfile -Name Home123
```

Returns WLAN profile Home123 and its encrypted password.

### EXAMPLE 3
```
Get-WLANProfile -Name Home123 -ClearText
```

Returns WLAN profile Home123 and its password in clear text.

## PARAMETERS

### -Name
Optional.
Name of WLAN profile to query.
Default (blank) returns all WLAN profiles.

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

### -ClearText
Optional.
Return passwords in clear text.
Default is to return as secure string values.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WLANProfile.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WLANProfile.md)

