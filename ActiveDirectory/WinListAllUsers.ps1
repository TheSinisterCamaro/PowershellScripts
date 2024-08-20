# Warning: Only use this on spcific domains as it could slow the network down on large returns
# This script lists all users in the Active Directory, displaying their Name, SamAccountName, and UserPrincipalName.
Get-ADUser -Filter *

Select-Object Name, SamAccountName, UserPrincipalName
