---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Split-Url.md
schema: 2.0.0
---

# Split-URL

## SYNOPSIS
Split a URL string into component strings

## SYNTAX

```
Split-URL [-Url] <String> [<CommonParameters>]
```

## DESCRIPTION
Split a URL string into component strings, such as ("https:","www.contoso.com","sales","default.aspx")

## EXAMPLES

### EXAMPLE 1
```
Split-Url "https://www.contoso.com/sales/default.aspx"
```

Returns ("https:","www.contoso.com","sales","default.aspx")

### EXAMPLE 2
```
"https://www.contoso.com/sales/default.aspx" | Split-Url
```

Returns ("https:","www.contoso.com","sales","default.aspx")

### EXAMPLE 3
```
("https://www.contoso.com/sales/default.aspx" | Split-Url)[1]
```

Returns "www.contoso.com"

## PARAMETERS

### -Url
Required.
The URL string.
Accepts pipeline input

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Split-Url.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Split-Url.md)

