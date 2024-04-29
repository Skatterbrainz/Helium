---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-DecimalErrorCode.md
schema: 2.0.0
---

# ConvertFrom-DecimalErrorCode

## SYNOPSIS
Convert Decimal error code

## SYNTAX

```
ConvertFrom-DecimalErrorCode [-DecimalErrorCode] <Int64> [<CommonParameters>]
```

## DESCRIPTION
Convert Decimal error code

## EXAMPLES

### EXAMPLE 1
```
-2147206582 | ConvertFrom-DecimalErrorCode
```

Returns: 0xffffffff80043a4a

## PARAMETERS

### -DecimalErrorCode
Error code in Decimal format

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
By Trevor Jones - https://smsagent.blog/2015/06/25/translating-error-codes-for-windows-and-configuration-manager/

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-DecimalErrorCode.md](https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-DecimalErrorCode.md)

