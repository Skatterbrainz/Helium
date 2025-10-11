---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-PsResourceMaintenance.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Invoke-PsResourceMaintenance
---

# Invoke-PsResourceMaintenance

## SYNOPSIS

Checks for updates to installed PowerShell modules and optionally updates them.

## SYNTAX

### __AllParameterSets

```
Invoke-PsResourceMaintenance [-UpdateAll] [-Quiet] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

This function checks all installed PowerShell modules for updates and can optionally update them.

## EXAMPLES

### EXAMPLE 1

Invoke-PsResourceMaintenance -UpdateAll
Updates all installed PowerShell modules to their latest versions.

### EXAMPLE 2

Invoke-PsResourceMaintenance -Quiet
Checks for updates to installed PowerShell modules without displaying output messages.

## PARAMETERS

### -Quiet

Suppresses output messages.

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

### -UpdateAll

Updates all installed modules without prompting for confirmation.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-PsResourceMaintenance.md)
