Send-MailMessage
    [-Attachments <String[]>]
    [-Bcc <String[]>]
    [[-Body] <String>]
    [-BodyAsHtml]
    [-Encoding <Encoding>]
    [-Cc <String[]>]
    [-DeliveryNotificationOption <DeliveryNotificationOptions>]
    -From <String>
    [[-SmtpServer] <String>]
    [-Priority <MailPriority>]
    [-ReplyTo <String[]>]
    [[-Subject] <String>]
    [-To] <String[]>
    [-Credential <PSCredential>]
    [-UseSsl]
    [-Port <Int32>]
    [<CommonParameters>]

$User = "k.malikbasha@accionlabs.com"
$PWord = ConvertTo-SecureString -String "7386216343kmr" -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord
Send-MailMessage -To 'k.kirankumarreddy@accionlabs.com' -From 'k.malikbasha@accionlabs.com' -Subject 'to test' -Body 'I need to test' -SmtpServer 'smtp.gmail.com' -Port 587 -UseSsl -Credential $cred 