---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-CustomizeWindows11.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Invoke-CustomizeWindows11
---

# Invoke-CustomizeWindows11

## SYNOPSIS

View or Toggle Windows 11 Customization Settings

## SYNTAX

### __AllParameterSets

```
Invoke-CustomizeWindows11 [-Toggle] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

View or Toggle Windows 11 Customization Settings using the PowerShell module CustomizeWindows11 by Jaap Brasser

## EXAMPLES

### EXAMPLE 1

Invoke-CustomizeWindows11

Displays current settings

### EXAMPLE 2

Invoke-CustomizeWindows11 -Toggle

Displays current settings in a GridView.
When a setting is selected and the OK button
is clicked,the setting is toggled to the opposite value.

## PARAMETERS

### -Toggle

Toggle the current value (if Enabled, set to Disabled)
Note that if a setting is not yet defined in the Registry, it shows as ----

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

Requires module CustomizeWindows11 by Jaap Brasser, which also indicates this function
has only been tested on Windows 11.


## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-CustomizeWindows11.md)
