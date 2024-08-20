# This script retrieves and displays the Group Policy Objects (GPOs) linked to a specific Organizational Unit (OU).
$ou = "OU=YourOU,DC=domain,DC=com"  # Replace with your OU's distinguished name

Get-GPLink -Target $ou

Select-Object Name, Enforced, LinkEnabled
