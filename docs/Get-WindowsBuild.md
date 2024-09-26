---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WindowsBuild.md
schema: 2.0.0
---

# Get-WindowsBuild

## SYNOPSIS
Returns list of Windows build numbers and versions.
Optionally filter by build number.

## SYNTAX

```
Get-WindowsBuild [[-BuildNumber] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Returns list of Windows build numbers and versions.
Optionally filter by build number.

## EXAMPLES

### EXAMPLE 1
```
Get-WindowsBuild
Returns all Windows build numbers and versions.
```

### EXAMPLE 2
```
Get-WindowsBuild -BuildNumber 19041
Returns Windows build number 19041 and version (Windows 10 2004)
```

## PARAMETERS

### -BuildNumber
Filter by build number.
If omitted, returns all build numbers.

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
https://gist.github.com/Skatterbrainz/9306ed76f08fb7e6868b8b7a1fc544c5

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WindowsBuild.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WindowsBuild.md)

