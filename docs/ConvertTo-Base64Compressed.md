---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-Base64Compressed.md
schema: 2.0.0
---

# ConvertTo-Base64Compressed

## SYNOPSIS
Convert string to Base64 compressed

## SYNTAX

```
ConvertTo-Base64Compressed [-string] <Object> [<CommonParameters>]
```

## DESCRIPTION
Convert an ASCII string to Base64 compressed format

## EXAMPLES

### EXAMPLE 1
```
"this is a test string" | ConvertTo-Base64Compressed
returns "H4sIAAAAAAAEACvJyCxWAKJEhZLU4hKF4pKizLx0ALXWhvwVAAAA"
```

## PARAMETERS

### -string
Required.
Text string to convert.

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

[https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-Base64Compressed.md](https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-Base64Compressed.md)

