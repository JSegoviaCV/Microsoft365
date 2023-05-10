Connect-ExchangeOnline

Get-Mailbox -ResultSize unlimited| Select Displayname, RetentionPolicy

Get-Mailbox -ResultSize unlimited | Set-Mailbox -RetentionPolicy "Retener 1 año a usuarios gerentes"