# This script lists all AD objects that have been modified in the last 7 days.
$timeSpan = (Get-Date).AddDays(-7)

Get-ADObject -Filter {whenChanged -gt $timeSpan}

Select-Object Name, ObjectClass, whenChanged
