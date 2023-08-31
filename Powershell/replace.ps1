$string1 = 'hkshfdkhf.1234567865.tsv'
$string2 = 'sjdbjbdjksad.3432534543.tsv'
$string3 = 'scccxzcsc.243544323454.tsv'
$string4 = 'sdcdscdsc.45645.tsv'


EX 1:-

$string = 'hkshfdkhf.1234567865.tsv'
$pattern = '[.][0-9]+'
$string -replace $pattern, ' '

-------------------------------------------------------------------------------------------------------------------------------------------------------

EX 2:- 

$filenames = "hkshfdkhf.1234567865.tsv", "sjdbjbdjksad.3432534543.tsv", "scccxzcsc.243544323454.tsv", "sdcdscdsc.45645.tsv"
$modifiedFilenames = $filenames -replace '\.(1234567865|3432534543|243544323454|45645)'

$modifiedFilenames

---------------------------------------------------------------------------------------------------------------------------------------------------------

For at a time all files renameing

Ex 3:-

$directory = "C:\Users\AL5423\Desktop\New folder"
Get-ChildItem -Path $directory | Rename-Item -NewName { $_.Name -replace '\.\d+', '' } -Force


