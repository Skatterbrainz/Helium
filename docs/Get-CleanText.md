---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-CleanText.md
schema: 2.0.0
---

# Get-CleanText

## SYNOPSIS
Remove non-ASCII alphanumeric characters from text string

## SYNTAX

```
Get-CleanText [[-String] <String>] [-NoSpaces] [<CommonParameters>]
```

## DESCRIPTION
Remove non-ASCII alphanumeric characters from test string, such as diactritics and
optionally remove spaces.

## EXAMPLES

### EXAMPLE 1
```
Get-CleanText "Entrepôt Jalapeño"
```

Returns "Entrepot Jalapeno"

### EXAMPLE 2
```
Get-CleanText "Entrepôt Jalapeño" -NoSpaces
```

Returns "EntrepotJalapeno"

## PARAMETERS

### -String
Required.
Input string value

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

### -NoSpaces
Optional.
Remove spaces

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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-CleanText.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-CleanText.md)

