# This script finds all user accounts that have their password set to never expire.
Get-ADUser -Filter {PasswordNeverExpires -eq $true} -Properties PasswordNeverExpires

Select-Object Name, SamAccountName, PasswordNeverExpires
