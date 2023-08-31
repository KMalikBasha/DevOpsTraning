$currentDate = Get-Date
$specificDate = Get-Date -Year 2023 -Month 6 -Day 19

if ($currentDate.Date -eq $specificDate.Date) 
{
    $dateString = "Daily Training and task Update " + $currentDate.ToString("d MMM yyyy")
}
 else 

{
    $dateString = "Daily Training and task Update " + $specificDate.ToString("d MMM yyyy")
}

Write-Host $dateString
