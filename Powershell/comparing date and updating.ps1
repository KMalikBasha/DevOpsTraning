$source = Get-ItemProperty -Path "D:\TerraFormDDI\variable.tf"

$d = [datetime](Get-ItemProperty -Path $source -Name LastWriteTime).lastwritetime
$d.Day
$currentdate= Get-date
$currentdate.Day

$condition = $true
if ( $d.Day -eq $currentdate.Day )
{
    $file1Lines = Get-Content -Path "D:\TerraFormDDI\variable.tf"
foreach ($file1Line in $file1Lines)
{

    $file1Line | Out-File -FilePath "C:\Users\AL5423\Desktop\filestruct\A.txt" -Append
   
}

$dots = "................"
$dots | Out-File -FilePath "C:\Users\AL5423\Desktop\filestruct\A.txt" -Append

}else{Write-Host "the file is not modified"}

