---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Export-BrowserProfile.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Export-BrowserProfile
---

# Export-BrowserProfile

## SYNOPSIS

Exports browser profiles to a destination path.

## SYNTAX

### Single (Default)

```
Export-BrowserProfile -Browser <string> -DestinationPath <string> [-MaxParallelJobs <int>] [-Quiet]
 [<CommonParameters>]
```

### All

```
Export-BrowserProfile -All -DestinationPath <string> [-MaxParallelJobs <int>] [-Quiet]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

This function exports user profiles from supported browsers (Chrome, Edge, Firefox, Brave) to a specified destination path.

It supports exporting from multiple browsers in parallel and can utilize rsync on non-Windows platforms for efficient copying.

## EXAMPLES

### EXAMPLE 1

Export-BrowserProfile -Browser Brave -DestinationPath "/backup/browsers"

Exports Brave browser profiles to the specified destination.

### EXAMPLE 2

Export-BrowserProfile -Browser Chrome -DestinationPath "C:\Backup\Chrome"

Exports Chrome browser profiles to the specified destination.

### EXAMPLE 3

Export-BrowserProfile -All -DestinationPath "/backup/browsers" -MaxParallelJobs 8

Exports profiles from all supported browsers to the specified destination using up to 8 parallel jobs.

### EXAMPLE 4

Export-BrowserProfile -All -DestinationPath "D:\BrowserBackups" -Quiet

Exports profiles from all supported browsers to the specified destination with minimal output.

## PARAMETERS

### -All

Export profiles from all supported browsers.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: All
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Browser

The browser to export profiles from.
Valid values: Chrome, Edge, Firefox, Brave

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Single
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DestinationPath

The target directory where profile backups will be created.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -MaxParallelJobs

Maximum number of parallel backup operations.
Default: 4

```yaml
Type: System.Int32
DefaultValue: 4
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

### -Quiet

Suppress verbose output.

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

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Export-BrowserProfile.md)
