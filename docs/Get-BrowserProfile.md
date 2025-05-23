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
Get-BrowserProfile [-Browser] <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Query Browser profiles, returning ID, Name and UserName.
For current user or all users

## EXAMPLES

### EXAMPLE 1
```
Get-BrowserProfile -Browser Edge
```

Returns all profiles for the Edge browser

### EXAMPLE 2
```
Get-BrowserProfile -Browser Chrome
```

Returns all profiles for the Chrome browser

## PARAMETERS

### -Browser
Optional.
Browser app to target for query (if installed)
* Chrome
* Edge
* Brave
* Firefox

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-BrowserProfile.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-BrowserProfile.md)

