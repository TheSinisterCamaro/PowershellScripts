# This script finds all inactive user accounts in AD (no logon for the last 90 days) and displays their Name and LastLogonDate.
$timeSpan = (Get-Date).AddDays(-90)

Get-ADUser -Filter {LastLogonDate -lt $timeSpan} -Properties LastLogonDate

Select-Object Name, LastLogonDate
