---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ScriptFunctionComments.md
schema: 2.0.0
---

# Get-ScriptFunctionComments

## SYNOPSIS
Extracts function comments from a script file.

## SYNTAX

```
Get-ScriptFunctionComments [[-FilePath] <String>] [[-FolderPath] <String>] [<CommonParameters>]
```

## DESCRIPTION
Extracts function comments from a script file.

## EXAMPLES

### EXAMPLE 1
```
Get-ScriptFunctionComments -FilePath "C:\GitHub\project42\runbooks\ula-support.ps1"
```

Extracts function comments from the specified script file.

### EXAMPLE 2
```
Get-ScriptFunctionComments -FolderPath "C:\GitHub\project42\runbooks"
```

Extracts function comments from all .ps1 script files in the specified folder.

## PARAMETERS

### -FilePath
The path to the script file to process.

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

### -FolderPath
The path to the folder containing script files to process.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Either FilePath or FolderPath must be specified.
If FilePath is provided, FolderPath is ignored.

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ScriptFunctionComments.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ScriptFunctionComments.md)

