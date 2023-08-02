---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Start-UrlDownloadFile.md
schema: 2.0.0
---

# Start-UrlDownloadFile

## SYNOPSIS
Download URI file to local file

## SYNTAX

```
Start-UrlDownloadFile [-URI] <String> [[-LocalPath] <String>] [-Force] [<CommonParameters>]
```

## DESCRIPTION
Download URI file to local file

## EXAMPLES

### EXAMPLE 1
```
Start-UrlDownloadFile "https://www.contoso.com/files/myfilename.cer" -LocalPath "c:\temp"
```

Downloads the content from the URL to c:\temp\myfilename.cer

## PARAMETERS

### -URI
Required.
URI of remote file to download.
The tail end of the URI will be used for the local file name
https://www.contoso.com/files/myfilename.cer will be downloaded to myfilename.cer in the -LocalPath folder

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

### -LocalPath
Optional.
Local folder path.
Default is $env:TEMP

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: $($env:TEMP)
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
{{ Fill Force Description }}

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Start-UrlDownloadFile.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Start-UrlDownloadFile.md)

