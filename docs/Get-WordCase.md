---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WordCase.md
schema: 2.0.0
---

# Get-WordCase

## SYNOPSIS
Convert a string of words to word case

## SYNTAX

```
Get-WordCase [-String] <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Convert a string of words to word case, where each word has the 
first letter UPPER case and the rest of the letters lower case

## EXAMPLES

### EXAMPLE 1
```
Get-WordCase "THE DOG RAN FAST."
```

Returns "The Dog Ran Fast."

## PARAMETERS

### -String
Required.
Input string value

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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WordCase.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WordCase.md)

