---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Join-Url.md
schema: 2.0.0
---

# Join-Url

## SYNOPSIS
Join-Path for WEB URL strings

## SYNTAX

```
Join-Url [-Path] <String> [-ChildPath] <String> [<CommonParameters>]
```

## DESCRIPTION
Join-Path for WEB URL strings

## EXAMPLES

### EXAMPLE 1
```
Join-Url -Path "https://www.contoso.com" -ChildPath "sales"
returns "https://www.contoso.com/sales"
```

### EXAMPLE 2
```
Join-Url -Path "https://www.contoso.com/sales/" -ChildPath "accounts"
returns "https://www.contoso.com/sales/accounts"
```

## PARAMETERS

### -Path
Base path string

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

### -ChildPath
Child path string to append to Path

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Join-Url.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Join-Url.md)

