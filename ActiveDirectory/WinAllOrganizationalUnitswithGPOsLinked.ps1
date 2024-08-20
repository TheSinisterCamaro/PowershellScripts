# This script finds and displays all OUs that have Group Policy Objects (GPOs) linked to them.
Get-ADOrganizationalUnit -Filter * -Property gplink

Where-Object { $_.gplink -ne $null }

Select-Object Name, DistinguishedName, gplink
