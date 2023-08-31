$securePassword = ConvertTo-SecureString -String '7386216343@Kmr' -AsPlainText -Force
$smtpCredentials = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList 'kutagoolamalik@gmail.com', $securePassword

Send-MailMessage -To 'malikmunna6343@gmail.com' -From 'kutagoolamalik' -Subject 'Testing' -Body 'Some important plain text!' -Credential $credential -SmtpServer 'smtp.gmail.com' -Port 587
