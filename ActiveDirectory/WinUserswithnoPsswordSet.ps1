# This script checks for any user accounts that do not have a password set.
Get-ADUser -Filter {PasswordNotRequired -eq $true} -Properties PasswordNotRequired

Select-Object Name, SamAccountName, PasswordNotRequired
