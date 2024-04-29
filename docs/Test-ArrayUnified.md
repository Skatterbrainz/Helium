---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Test-ArrayUnified.md
schema: 2.0.0
---

# Test-ArrayUnified

## SYNOPSIS
Tests if all elements in an array are equal to a reference value

## SYNTAX

```
Test-ArrayUnified [-Array] <Array> [-ReferenceValue] <Object> [<CommonParameters>]
```

## DESCRIPTION
Tests if all elements in an array are equal to a reference value

## EXAMPLES

### EXAMPLE 1
```
Test-ArrayUnified -Array @('a','a','a') -ReferenceValue 'a'
```

returns True

### EXAMPLE 2
```
Test-ArrayUnified -Array @('a','b','a') -ReferenceValue 'a'
```

returns False

## PARAMETERS

### -Array
Array to test

```yaml
Type: Array
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ReferenceValue
Reference value to test against

```yaml
Type: Object
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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Test-ArrayUnified.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Test-ArrayUnified.md)

