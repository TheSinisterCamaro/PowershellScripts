# This script lists all groups in Active Directory, displaying their Name and GroupScope.
Get-ADGroup -Filter *

Select-Object Name, GroupScope
