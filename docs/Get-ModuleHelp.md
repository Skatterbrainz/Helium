---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ModuleHelp.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Get-ModuleHelp
---

# Get-ModuleHelp

## SYNOPSIS

Return Get-Help summary for all commands in a given module

## SYNTAX

### __AllParameterSets

```
Get-ModuleHelp [-ModuleName] <string> [[-OutputPath] <string>] [-Export] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Return Get-Help summary for all commands in a given module

## EXAMPLES

### EXAMPLE 1

Get-ModuleHelp -ModuleName PowerShellAI

Displays help summary for all commands in the module PowerShellAI (if it is installed)

## PARAMETERS

### -Export

Send output to a CSV or XLSX file.
If module ImportExcel is installed, it 
will default to XLSX format.
The filename is pshelp_<MODULENAME>.<EXTENSION>.
If XLSX format is used, the file is automatically opened in Excel.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ModuleName

Name of module

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -OutputPath

Path where output file is saved when using -Export

```yaml
Type: System.String
DefaultValue: '"$env:TEMP"'
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ModuleHelp.md)
