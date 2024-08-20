# This script lists all users in a specific department in AD, displaying their Name, Title, and Department.
$department = "IT"  # Replace with the actual department name

Get-ADUser -Filter {Department -eq $department} -Property Title, Department

Select-Object Name, Title, Department
