# This script identifies accounts that have Kerberos delegation enabled, which is a potential security risk.
Get-ADUser -Filter {TrustedForDelegation -eq $true} -Properties TrustedForDelegation

Select-Object Name, SamAccountName, TrustedForDelegation
