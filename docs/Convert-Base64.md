---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Convert-Base64.md
schema: 2.0.0
---

# Convert-Base64

## SYNOPSIS
Convert string to Base64 compressed, or from Base64 compressed to ASCII

## SYNTAX

```
Convert-Base64 [-String] <Object> [-Output] <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Convert string to Base64 compressed, or from Base64 compressed to ASCII

## EXAMPLES

### EXAMPLE 1
```
$x = "this is a test string" | Convert-Base64 -Output Base64
returns "H4sIAAAAAAAEACvJyCxWAKJEhZLU4hKF4pKizLx0ALXWhvwVAAAA"
```

$x | Convert-Base64 -Output Base64
Returns "this is a test string"

### EXAMPLE 2
```
"H4sIAAAAAAAEACvJyCxWAKJEhZLU4hKF4pKizLx0ALXWhvwVAAAA" | Convert-Base64 -Output ASCII
returns "this is a test string"
```

## PARAMETERS

### -String
Required.
String value to be converted.

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

### -Output
Required.
Options are Base64 or ASCII

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

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Convert-Base64.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Convert-Base64.md)

