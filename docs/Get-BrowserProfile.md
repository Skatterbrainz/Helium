---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-BrowserProfile.md
schema: 2.0.0
---

# Get-BrowserProfile

## SYNOPSIS
Query Browser Profiles

## SYNTAX

```
Get-BrowserProfile [[-ProfileName] <String>] [-PreferenceDetails] [[-Browser] <String>] [-AllUsers]
 [<CommonParameters>]
```

## DESCRIPTION
Query Browser profiles, returning ID, Name and UserName.
For current user or all users

## EXAMPLES

### EXAMPLE 1
```
Get-BrowserProfile
```

### EXAMPLE 2
```
Get-BrowserProfile -Browser Edge
```

### EXAMPLE 3
```
Get-BrowserProfile -Browser Chrome -AllUsers
```

### EXAMPLE 4
```
Get-BrowserProfile -ProfileName "Azure" -PreferenceDetails
```

## PARAMETERS

### -ProfileName
Return information on one specific profile only

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

### -PreferenceDetails
If ProfileName is specified, will return the Preferences object

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

### -Browser
Optional.
Browser app to target for query (if installed)
* Default = Get default browser from registry query
* Chrome
* Edge
* Brave
* Firefox

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Default
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllUsers
Query all users on the computer

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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-BrowserProfile.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-BrowserProfile.md)

