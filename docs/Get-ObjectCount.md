---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ObjectCount.md
Locale: en-US
Module Name: helium
ms.date: 05/20/2026
PlatyPS schema version: 2024-05-01
title: Get-ObjectCount
---

# Get-ObjectCount

## SYNOPSIS

Counts objects by a specified property.

## SYNTAX

### __AllParameterSets

```
Get-ObjectCount [-InputObject] <PSObject> [-Property] <string[]> [[-First] <int>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  Count-Object

## DESCRIPTION

Counts and groups input objects by one or more properties, then sorts the results by count in descending order.

## EXAMPLES

### EXAMPLE 1

Get-ObjectCount -InputObject $data -Property Category

Counts the number of objects in $data grouped by the Category property.

### EXAMPLE 2

Get-Process | Get-ObjectCount -Property Name -First 5

Counts processes grouped by Name and returns the top 5 most common process names.

## PARAMETERS

### -First

The number of top results to return.

```yaml
Type: System.Int32
DefaultValue: ''
SupportsWildcards: false
Aliases: [Top]
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

### -InputObject

The input object to be counted.

```yaml
Type: System.Management.Automation.PSObject
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Property

The property name or names to group by.

```yaml
Type: System.String[]
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Management.Automation.PSObject

Objects provided by pipeline input or through the InputObject parameter.

## OUTPUTS

### System.Management.Automation.PSCustomObject

Objects with Count and Name properties.

## NOTES

Alias: Count-Object

## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ObjectCount.md)
