---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Confirm-Modules.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Confirm-Modules
---

# Confirm-Modules

## SYNOPSIS

Check if installed modules are up to date

## SYNTAX

### __AllParameterSets

```
Confirm-Modules [[-Exclude] <string[]>] [[-ExcludePattern] <string[]>] [-Update]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Check installed modules against PowerShell Gallery to confirm they
are current version.
If not, optionally, update them to current.

## EXAMPLES

### EXAMPLE 1

Confirm-Modules

Checks modules to report current version status: Current, OutOfDate or LocalOnly.

### EXAMPLE 2

Confirm-Modules -Update

Checks module versions and updates those which report status OutOfDate.

### EXAMPLE 3

Confirm-Modules -Exclude MyModule,OtherModule -Update

Checks all modules except for MyModule and OtherModule and updates the rest if they
report status OutOfDate.

### EXAMPLE 4

Confirm-Modules -Exclude MyModule,OtherModule -ExcludePattern Microsoft.Graph.* -Update

Checks all modules except for MyModule and OtherModule and any with names that start
with "Microsoft.Graph." and updates the rest if they report status OutOfDate.

### EXAMPLE 5

Confirm-Modules -Exclude Az -ExcludePattern Az.*,Microsoft.Graph.* -Update

Checks all modules except for Az and any with names that start
with "Az." or "Microsoft.Graph." and updates the rest if they report status OutOfDate.

## PARAMETERS

### -Exclude

Names of modules to ignore.
Note that local-only modules (not installed from, or available
within the PowerShell Gallery) are ignored as well.

```yaml
Type: System.String[]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ExcludePattern

One or more wildcard patterns to filter out module names to exclude them from validation.
Example: Microsoft.Graph.* or Az.*, Microsoft.Graph.*

```yaml
Type: System.String[]
DefaultValue: ''
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

### -Update

Update modules which are not the latest version.

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

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Confirm-Modules.md)
