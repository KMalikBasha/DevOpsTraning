A
B
.....................
c
d
.......................
e
f
.....................
g
h
.......................





# Set the path to your file
$filePath = "C:\Users\AL5423\Desktop\Powershell\A.ps1"

# Read all the lines from the file
$lines = Get-Content -Path $filePath

# Get the first three lines and print them
$firstThreeLines = $lines[0..2]
$firstThreeLines

# Skip the first three lines
$skippedLines = $lines[3..($lines.Count - 1)]

# Append the skipped lines to the end
$remainingLines = $skippedLines + $firstThreeLines

# Output the resulting lines
$remainingLines

# Save the modified lines back to the file
$remainingLines | Set-Content -Path $filePath




