---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Publish-AiCommit.md
schema: 2.0.0
---

# Publish-AiCommit

## SYNOPSIS
Use PowerShellAI to handle your Git commits

## SYNTAX

```
Publish-AiCommit [[-Path] <String>] [-Send] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Invoke git stage, commit, push from a local repo path, where the commit
message is produced by submitting a request from the git status through openAI

## EXAMPLES

### EXAMPLE 1
```
Publish-AiCommit
```

Shows the staging message returned from the OpenAI request

### EXAMPLE 2
```
Publish-AiCommit -Send
```

Shows the staging message from OpenAI for the repo in the current directory, and commits the changes, then issues a push command

### EXAMPLE 3
```
Publish-AiCommit -Path ".\repo42\" -Send
```

Shows the staging message from OpenAI for the repo in the specified path, and commits the changes, then issues a push command

## PARAMETERS

### -Path
Path to the local git repository

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

### -Send
Commit the changes and issue a push command

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
Requires PowerShellAI module and having the OpenAI API key defined as environment variable "OpenAIKey"

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Publish-AiCommit.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Publish-AiCommit.md)

