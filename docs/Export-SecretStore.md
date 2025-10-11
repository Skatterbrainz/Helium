---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Export-SecretStore.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Export-SecretStore
---

# Export-SecretStore

## SYNOPSIS

Exports secrets from a specified secret vault.

## SYNTAX

### __AllParameterSets

```
Export-SecretStore [-VaultName] <string> [[-OutputFile] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

This function retrieves secrets from a specified secret vault and exports them in a clear text format.

## EXAMPLES

### EXAMPLE 1

Export-SecretStore -VaultName "MyVault" -OutputFile "C:\secrets.json"

Exports secrets from the "MyVault" secret vault to the specified JSON file.

### EXAMPLE 2

Export-SecretStore -VaultName "MyVault"

Exports secrets from the "MyVault" secret vault to the default output (console).

## PARAMETERS

### -OutputFile

The path to the output file where the exported secrets will be saved.

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

### -VaultName

The name of the secret vault to export secrets from.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

Requires Microsoft.PowerShell.SecretManagement module.


## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Export-SecretStore.md)
