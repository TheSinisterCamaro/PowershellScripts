# This script checks if a specific AD user account is locked out.
$userName = "username"  # Replace with the actual username

Get-ADUser -Identity $userName -Properties LockedOut

Select-Object Name, LockedOut
