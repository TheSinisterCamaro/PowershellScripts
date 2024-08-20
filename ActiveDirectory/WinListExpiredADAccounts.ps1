# This script lists all expired user accounts in AD, displaying their Name and AccountExpirationDate.
Get-ADUser -Filter {AccountExpirationDate -lt (Get-Date)} -Property AccountExpirationDate

Select-Object Name, AccountExpirationDate
