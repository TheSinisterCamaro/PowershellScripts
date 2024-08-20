# This script finds all computer accounts in AD that haven't logged on in the last 180 days.
$timeSpan = (Get-Date).AddDays(-180)

Get-ADComputer -Filter {LastLogonDate -lt $timeSpan} -Property LastLogonDate

Select-Object Name, LastLogonDate
