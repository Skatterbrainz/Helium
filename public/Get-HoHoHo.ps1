function Get-HoHoHo {
	[CmdletBinding()]
	param ()
	if (!$IsWindows) {
		Write-Warning "This script is designed to run on Windows only."
		break
	}
	Write-Host "If you don't believe in Christmas, just go with it."
	function Write-ProperCounter {
		param (
			[parameter(Mandatory = $True)]
			[ValidateRange(1, 12)]
			[int] $Number
		)
		if ($Number -gt 3) {
			return $([string]$Number + 'th')
		} else {
			switch ($Number) {
				1 { return '1st'; break; }
				2 { return '2nd'; break; }
				3 { return '3rd'; break; }
			}
		}
	}
  
	$gifts = (
		'a partridge in a Pear tree',
		'Turtle doves, and',
		'French hens',
		'Colly birds',
		'gold rings',
		'geese a-laying',
		'swans a-swimming',
		'maids a-milking',
		'ladies dancing',
		'lords a-leaping',
		'pipers piping',
		'drummers drumming'
	)
	# the sleigh ride...
	Add-Type -AssemblyName System.Speech
	$Speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
  
	for ($i = 0; $i -lt $gifts.Count; $i++) {
		Write-Host "On the $(Write-ProperCounter $($i + 1)) day of Christmas, my true love gave to me:"
		$speak.speak(“On the $(Write-ProperCounter $($i + 1)) day of Christmas, my true love gave to me,”)
		$mygifts = [string[]]$gifts[0..$i]
		[array]::Reverse($mygifts)
		$x = $i + 1
		foreach ($gift in $mygifts) {
			if ($x -eq 1) {
				$thisGift = $gift
			} else {
				$thisGift = "$x $gift"
			}
			Write-Host "...$thisGift"
			$Speak.Speak($thisGift)
			$x--
		}
	}
}