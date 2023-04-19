---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-Sed.md
schema: 2.0.0
---

# Invoke-Sed

## SYNOPSIS
Invoke-Sed

## SYNTAX

```
Invoke-Sed [-FilePath] <String> [-Find] <String> [[-Filter] <String>] [[-ReplaceWith] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Search/Replace matching text pattern within specified files

## EXAMPLES

### EXAMPLE 1
```
Invoke-Sed -FilePath "c:\mydocs" -Filter "*.txt" -Find "Contoso" -ReplaceWith "Fabrikam"
```

## PARAMETERS

### -FilePath
Path where files reside

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

### -Find
Text pattern to search for

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

### -Filter
File name/extension pattern.
Default is *.* (all files)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: *.*
Accept pipeline input: False
Accept wildcard characters: False
```

### -ReplaceWith
Text to replace the matching pattern instances

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-Sed.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-Sed.md)

