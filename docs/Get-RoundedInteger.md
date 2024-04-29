---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-RoundedInteger.md
schema: 2.0.0
---

# Get-RoundedInteger

## SYNOPSIS
Get rounded integer to nearest base or floor number

## SYNTAX

```
Get-RoundedInteger [-Integer] <Int32> [[-Nearest] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Round integer number to nearest BASE value (e.g.
10, 100, 1000)
Note this is NOT a standard Round operation.
A standard Round of 1055 to the nearest 100 would result in 1100
	\[math\]::Round(1055 / 100) * 100 = 1100
This round uses the nearest base or floor
	Get-RoundedInteger 1055 100 = 1000

## EXAMPLES

### EXAMPLE 1
```
Get-RoundedInteger -Integer 124 -Nearest 10
```

Returns 120

### EXAMPLE 2
```
Get-RoundedInteger -Integer 1123 -Nearest 100
```

Returns 1100

## PARAMETERS

### -Integer
Required.
Integer value to apply rounding

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Nearest
Optional.
Nearest precision to round \[Integer\] to.
Default is 100

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 100
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-RoundedInteger.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-RoundedInteger.md)

