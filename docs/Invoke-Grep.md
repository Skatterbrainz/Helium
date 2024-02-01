---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-Grep.md
schema: 2.0.0
---

# Invoke-Grep

## SYNOPSIS
Search text or file content for matching string pattern

## SYNTAX

```
Invoke-Grep [-Pattern] <String> [[-InputString] <String>] [[-Path] <String>] [-Recurse] [<CommonParameters>]
```

## DESCRIPTION
Search text or file content for matching string pattern

## EXAMPLES

### EXAMPLE 1
```
Invoke-Grep -Pattern "Contoso Corp" -InputString "The facility is owned by Contoso Corp, who recently leased it."
```

### EXAMPLE 2
```
Invoke-Grep -Pattern "Contoso Corp" -Path "c:\mydocs" -Recurse
```

## PARAMETERS

### -Pattern
Text pattern to search for

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

### -InputString
String to search for matching Pattern value

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Path to search files for matching Pattern value.
If Path is provided, InputString is ignored

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

### -Recurse
Optional.
Only used with Path parameter.
Default is to scan files
in the Path location only, not sub-folders.
If Recurse is used, scan
will include sub-folders

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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-Grep.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-Grep.md)

