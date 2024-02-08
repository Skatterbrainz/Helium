---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-Base64.md
schema: 2.0.0
---

# ConvertTo-Base64

## SYNOPSIS
Convert ASCII or Unicode string to Base64

## SYNTAX

```
ConvertTo-Base64 [-String] <Object> [-Compressed] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Convert ASCII or Unicode string to Base64 string

## EXAMPLES

### EXAMPLE 1
```
$x = "this is a test string"
$x | ConvertTo-Base64
Returns: "H4sIAAAAAAAEACvJyCxWAKJEhZLU4hKF4pKizLx0ALXWhvwVAAAA"
```

### EXAMPLE 2
```
"this is a compressed test string" | ConvertTo-Base64 -Compressed
returns: "H4sIAAAAAAAACivJyCxWAKJEheT83IKi1OLi1BSFktTiEoXikqLMvHQAhzKd/iAAAAA="
```

## PARAMETERS

### -String
Required.
ASCII or Unicode string value to be converted.

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
Compress results, or decode from compressed source

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
Compressed may result in a longer Base64 output.

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-Base64.md](https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-Base64.md)

