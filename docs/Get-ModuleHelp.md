---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ModuleHelp.md
schema: 2.0.0
---

# Get-ModuleHelp

## SYNOPSIS
Return Get-Help summary for all commands in a given module

## SYNTAX

```
Get-ModuleHelp [-ModuleName] <String> [-Export] [[-OutputPath] <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Return Get-Help summary for all commands in a given module

## EXAMPLES

### EXAMPLE 1
```
Get-ModuleHelp -ModuleName PowerShellAI
```

Displays help summary for all commands in the module PowerShellAI (if it is installed)

## PARAMETERS

### -ModuleName
Name of module

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

### -Export
Send output to a CSV or XLSX file.
If module ImportExcel is installed, it 
will default to XLSX format.
The filename is pshelp_\<MODULENAME\>.\<EXTENSION\>.
If XLSX format is used, the file is automatically opened in Excel.

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

### -OutputPath
Path where output file is saved when using -Export

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: "$env:TEMP"
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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ModuleHelp.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ModuleHelp.md)

