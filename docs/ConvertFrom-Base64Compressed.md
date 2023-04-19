---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-Base64Compressed.md
schema: 2.0.0
---

# ConvertFrom-Base64Compressed

## SYNOPSIS
Convert string from Base64 compressed to ASCII

## SYNTAX

```
ConvertFrom-Base64Compressed [-EncodedText] <Object> [<CommonParameters>]
```

## DESCRIPTION
Convert a Base64 encoded string to ASCII

## EXAMPLES

### EXAMPLE 1
```
$x = "this is a test string" | ConvertTo-Base64Compressed
returns "H4sIAAAAAAAEACvJyCxWAKJEhZLU4hKF4pKizLx0ALXWhvwVAAAA"
```

$x | ConvertFrom-Base64Compressed
Returns "this is a test string"

## PARAMETERS

### -EncodedText
{{ Fill EncodedText Description }}

```yaml
Type: Object
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

[https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-Base64Compressed.md](https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-Base64Compressed.md)

