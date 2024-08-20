# This script finds and displays all users in AD who do not have an email address set.
Get-ADUser -Filter {EmailAddress -notlike "*@*"}

Select-Object Name, SamAccountName
