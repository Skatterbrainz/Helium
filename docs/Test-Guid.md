---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Test-Guid.md
schema: 2.0.0
---

# Test-Guid

## SYNOPSIS
Tests if a string is a valid GUID

## SYNTAX

```
Test-Guid [[-Guid] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Tests if a string is a valid GUID

## EXAMPLES

### EXAMPLE 1
```
Test-Guid -Guid '1234abcd-4321-6789-defg-abcdef123456'
Returns True
```

### EXAMPLE 2
```
Test-Guid -Guid '1234abcd-4321-6789-defg-abcdef1234567'
Returns False
```

## PARAMETERS

### -Guid
Required.
The string to test

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Test-Guid.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Test-Guid.md)

