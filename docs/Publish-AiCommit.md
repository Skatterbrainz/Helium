---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Publish-AiCommit.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Publish-AiCommit
---

# Publish-AiCommit

## SYNOPSIS

Use PowerShellAI to handle your Git commits

## SYNTAX

### __AllParameterSets

```
Publish-AiCommit [[-Path] <string>] [[-CustomComment] <string>] [-Send] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Invoke git stage, commit, push from a local repo path, where the commit
message is produced by submitting a request from the git status through openAI

## EXAMPLES

### EXAMPLE 1

Publish-AiCommit

Shows the staging message returned from the OpenAI request

### EXAMPLE 2

Publish-AiCommit -Send

Shows the staging message from OpenAI for the repo in the current directory, and commits the changes, then issues a push command

### EXAMPLE 3

Publish-AiCommit -Path ".\repo42\" -Send

Shows the staging message from OpenAI for the repo in the specified path, and commits the changes, then issues a push command

## PARAMETERS

### -CustomComment

{{ Fill CustomComment Description }}

```yaml
Type: System.String
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

### -Path

Path to the local git repository

```yaml
Type: System.String
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

### -Send

Commit the changes and issue a push command

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

Requires PowerShellAI module and having the OpenAI API key defined as environment variable "OpenAIKey"


## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Publish-AiCommit.md)
