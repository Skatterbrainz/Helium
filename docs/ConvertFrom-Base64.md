---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-Base64.md
schema: 2.0.0
---

# ConvertFrom-Base64

## SYNOPSIS
Convert string from Base64 to ASCII

## SYNTAX

```
ConvertFrom-Base64 [-String] <Object> [-Compressed] [<CommonParameters>]
```

## DESCRIPTION
Convert string to Base64 string to ASCII string

## EXAMPLES

### EXAMPLE 1
```
"H4sIAAAAAAAEACvJyCxWAKJEhZLU4hKF4pKizLx0ALXWhvwVAAAA" | ConvertFrom-Base64
```

returns: "this is a test string"

## PARAMETERS

### -String
Required.
Base64 encoded string value to be converted.

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

### -Compressed
Optional.
Decode from compressed source

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

[https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-Base64.md](https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-Base64.md)

