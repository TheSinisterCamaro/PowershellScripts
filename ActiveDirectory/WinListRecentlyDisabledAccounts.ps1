# This script lists all user accounts that have been disabled in the last 30 days.
$timeSpan = (Get-Date).AddDays(-30)

Get-ADUser -Filter {Enabled -eq $false -and whenChanged -gt $timeSpan}

Select-Object Name, SamAccountName, whenChanged
