# This script lists all service accounts in AD, which typically have the `ServicePrincipalName` property set.
Get-ADUser -Filter {ServicePrincipalName -ne "$null"}

Select-Object Name, SamAccountName, ServicePrincipalName
