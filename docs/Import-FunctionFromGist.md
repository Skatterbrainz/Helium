---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Import-FunctionFromGist.md
schema: 2.0.0
---

# Import-FunctionFromGist

## SYNOPSIS
Define a function by importing script from GitHub Gist URL

## SYNTAX

```
Import-FunctionFromGist [-URL] <String> [<CommonParameters>]
```

## DESCRIPTION
Import Gist raw content, wrap in function block, and invoke-expression to conver to a function

## EXAMPLES

### EXAMPLE 1
```
$url = 'https://gist.githubusercontent.com/Skatterbrainz/c222038b4a9a178d09428e144d86a953/raw/a3ba51e55115d5c0ab31e8fa609edf2328f3a3ec/get-pcinfo.ps1'
```

Import-FunctionFromGist -URL $url
Defines function get-pcinfo using filename "get-pcinfo.ps1" from the end of the URL

## PARAMETERS

### -URL
Required.
URL for GitHub Gist to import as PowerShell function.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
The Gist content must be a PowerShell script that can be contained as a function.
The URL must be to the RAW view of the Gist, not the HTML wrapped view.
The URL tail/leaf that indicates the filename is applied as the function name.

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Import-FunctionFromGist.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Import-FunctionFromGist.md)

