---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-CleanString.md
schema: 2.0.0
---

# Get-AsciiString

## SYNOPSIS
Trim leading and trailing spaces from string, and optionally replace non-ASCII characters

## SYNTAX

```
Get-AsciiString [[-String] <String>] [-Cleanup] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Trim leading and trailing spaces from string, and optionally replace non-ASCII characters
such as diacritic characters with corresponding ASCII characters

## EXAMPLES

### EXAMPLE 1
```
Get-AsciiString 'diakritikós '
```

returns 'diakritikós' (trailing space removed)

### EXAMPLE 2
```
Get-AsciiString 'diakritikós ' -Cleanup
```

returns 'diakritikos' (trailing space removed, and ó is replace with o)

## PARAMETERS

### -String
Required.
String value to be trimmed and cleaned.

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

### -Cleanup
Optional.
Replace diacritic characters with ASCII characters

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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-CleanString.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-CleanString.md)

