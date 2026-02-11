---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-MarkdownTable.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: ConvertTo-MarkdownTable
---

# ConvertTo-MarkdownTable

## SYNOPSIS

Converts an array of objects into a markdown table format.

## SYNTAX

### __AllParameterSets

```
ConvertTo-MarkdownTable [[-InputObject] <Object[]>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

This function takes an array of objects and generates a markdown table string.
Each object's properties will be used as columns in the table, and the values will populate the rows.

## EXAMPLES

### EXAMPLE 1

$data = @(
	[PSCustomObject]@{ Name = "Alice"; Age = 30; City = "New York" },
	[PSCustomObject]@{ Name = "Bob"; Age = 25; City = "Los Angeles" },
	[PSCustomObject]@{ Name = "Charlie"; Age = 35; City = "Chicago" }
)
$markdownTable = $data | ConvertTo-MarkdownTable
Write-Output $markdownTable

## PARAMETERS

### -InputObject

An array of objects to be converted into a markdown table.
Each object should have the same properties for consistent column headers.

```yaml
Type: System.Object[]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: false
  ValueFromPipeline: true
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

### System.Object[]

{{ Fill in the Description }}

## OUTPUTS

### System.String

{{ Fill in the Description }}

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-MarkdownTable.md)
