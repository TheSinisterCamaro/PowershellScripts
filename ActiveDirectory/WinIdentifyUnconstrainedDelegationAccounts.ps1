# This script identifies and displays all accounts configured for unconstrained delegation in AD.
Get-ADUser -Filter {TrustedForDelegation -eq $true} -Properties SamAccountName, UserPrincipalName, TrustedForDelegation

Select-Object SamAccountName, UserPrincipalName, TrustedForDelegation
