# This script retrieves and displays all Organizational Units (OUs) in AD.
Get-ADOrganizationalUnit -Filter *

Select-Object Name, DistinguishedName
