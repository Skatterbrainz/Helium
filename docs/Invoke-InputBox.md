---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-InputBox.md
schema: 2.0.0
---

# Invoke-InputBox

## SYNOPSIS
Provide InputBox() clone for PowerShell

## SYNTAX

```
Invoke-InputBox [-Title] <String> [-Message] <String> [[-DefaultResponse] <String>] [<CommonParameters>]
```

## DESCRIPTION
Provide InputBox() clone for PowerShell

## EXAMPLES

### EXAMPLE 1
```
$zip = Invoke-InputBox -Title "Mail Delivery" -Message "Enter ZIP code"
```

### EXAMPLE 2
```
$zip = Invoke-InputBox -Title "Mail Delivery" -Message "Enter ZIP code" -DefaultResponse "12345-0987"
```

## PARAMETERS

### -Title
Form Title / caption

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

### -Message
Form prompt or message text

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

### -DefaultResponse
Default value to offer to user.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-InputBox.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-InputBox.md)

