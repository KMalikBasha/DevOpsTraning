# Set the email details
$smtpServer = "smtp.gmail.com"
$smtpPort = 587
$smtpUsername = "malikmunna6343@gmail.com"
$smtpPassword = "7386216343kmr"
$from = "malikmunna6343@gmail.com"
$to = "kutagoolamalik@gmail.com"
$subject = "Daily Training and task update 16th May"
$body = "This is your daily update."

# Create a credential object for SMTP authentication
$smtpCredentials = New-Object System.Management.Automation.PSCredential ($smtpUsername, (ConvertTo-SecureString -String $smtpPassword -AsPlainText -Force))

# Loop to send emails daily
while ($true) {
    # Get the current date
    $currentDate = Get-Date -Format "yyyy-MM-dd"

    # Compose the email message
    $message = @{
        From = $from
        To = $to
        Subject = $subject
        Body = $body
        SmtpServer = $smtpServer
        Credential = $smtpCredentials
    }

    # Send the email
    Send-MailMessage @message

    # Display a confirmation message
    Write-Host "Email sent on $currentDate."

    # Pause for 24 hours (86,400 seconds) before sending the next email
    Start-Sleep -Seconds 86400
}
