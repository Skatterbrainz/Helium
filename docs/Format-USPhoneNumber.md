---
external help file: helium-help.xml
Module Name: helium
online version:
schema: 2.0.0
---

# Format-USPhoneNumber

## SYNOPSIS
Formats a phone number to the standard format (XXX) XXX-XXXX or +1 (XXX) XXX-XXXX.

## SYNTAX

```
Format-USPhoneNumber [-PhoneNumber] <String> [-includeCountryCode] [[-CountrCode] <Int32>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Formats a phone number to a standard format.
The function accepts a phone number in various formats and returns the phone number in the format (XXX) XXX-XXXX.
The function also accepts a switch parameter to include the country code.

## EXAMPLES

### EXAMPLE 1
```
Format-USPhoneNumber -PhoneNumber "1234567890" -includeCountryCode
Formats the phone number 1234567890 to (123) 456-7890 with the country code +1.
```

### EXAMPLE 2
```
Format-USPhoneNumber -PhoneNumber "123 456 7890" -includeCountryCode
Formats the phone number 123 456 7890 to (123) 456-7890 with the country code +1.
```

### EXAMPLE 3
```
Format-USPhoneNumber -PhoneNumber "123-456-7890" -includeCountryCode
Formats the phone number 123-456-7890 to (123) 456-7890 with the country code +1.
```

### EXAMPLE 4
```
Format-USPhoneNumber -PhoneNumber "(123) 456-7890" -includeCountryCode
Formats the phone number (123) 456-7890 to (123) 456-7890 with the country code +1.
```

### EXAMPLE 5
```
Format-USPhoneNumber -PhoneNumber "(123)-456-7890" -includeCountryCode
Formats the phone number (123)-456-7890 to (123) 456-7890 with the country code +1.
```

### EXAMPLE 6
```
Format-USPhoneNumber -PhoneNumber "123-456-7890" -includeCountryCode
Formats the phone number 123-456-7890 to (123) 456-7890 with the country code +1.
```

### EXAMPLE 7
```
Format-USPhoneNumber -PhoneNumber "123.456.7890" -includeCountryCode
Formats the phone number 123.456.7890 to (123) 456-7890 with the country code +1.
```

## PARAMETERS

### -PhoneNumber
The phone number to format.
The phone number can be in the following formats:
- 1234567890
- 123 456 7890
- 123-456-7890
- (123) 456-7890
- (123)-456-7890
- 123-456-7890
- 123.456.7890

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

### -includeCountryCode
A switch parameter to include the country code in the formatted phone number.

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

### -CountrCode
{{ Fill CountrCode Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 1
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
