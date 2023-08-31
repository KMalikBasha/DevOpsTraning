$Date = Get-Date
$StartDate = Get-Date -Year 2023 -Month 6 -Day 19
$EndDate= Get-Date -Year 2023 -Month 12 -Day 31

function Get-DateOrdinalSuffix([datetime]$Date) {
    switch -regex ($Date.Day.ToString()) {
        '1(1|2|3)$' { 'th'; break }
        '.?1$'      { 'st'; break }
        '.?2$'      { 'nd'; break }
        '.?3$'      { 'rd'; break }
        default     { 'th'; break }
    }
}

$d = (Get-Date).AddDays(1)
$suffix = Get-DateOrdinalSuffix $d
$dateFormatted = "{0} {1:MMMM} {2}{3} {4}" -f $d.DayOfWeek, $d, $d.Day, $suffix, $d.Year

if ($Date.Date -eq $StartDate.Date) 
{
    $dateString = "Daily Training and task Update " + $dateFormatted
}

Write-Host $dateString