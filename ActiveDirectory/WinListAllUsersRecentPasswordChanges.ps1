# This script lists all user accounts that have had their passwords changed in the last 30 days.
$timeSpan = (Get-Date).AddDays(-30)

Get-ADUser -Filter {PasswordLastSet -ge $timeSpan} -Properties PasswordLastSet

Select-Object Name, SamAccountName, PasswordLastSet
