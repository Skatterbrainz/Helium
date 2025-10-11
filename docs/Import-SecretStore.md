---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Import-SecretStore.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Import-SecretStore
---

# Import-SecretStore

## SYNOPSIS

Imports secrets from a JSON file into a specified secret vault.

## SYNTAX

### __AllParameterSets

```
Import-SecretStore [-Path] <string> [-VaultName] <string> [-Force] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

This function reads a JSON file containing secrets and imports them into a specified secret vault.
If the vault does not exist, it will be created.
Existing secrets can be overwritten if the -Force
parameter is specified.

## EXAMPLES

### EXAMPLE 1

Import-SecretStore -Path "C:\secrets.json" -VaultName "MyVault"

Imports secrets from the specified JSON file into the "MyVault" secret vault.

### EXAMPLE 2

Import-SecretStore -Path "C:\secrets.json" -VaultName "MyVault" -Force

Forces the overwriting of existing secrets in the "MyVault" secret vault.

## PARAMETERS

### -Force

Forces the overwriting of existing secrets in the vault.

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

### -Path

The path to the JSON file containing the secrets.

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

### -VaultName

The name of the secret vault to import the secrets into.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
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

Requires the Microsoft.PowerShell.SecretManagement and Microsoft.PowerShell.SecretStore modules.


## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Import-SecretStore.md)
