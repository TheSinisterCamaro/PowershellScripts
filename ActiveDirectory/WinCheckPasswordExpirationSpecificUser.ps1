# This script checks and displays the password expiration date for a specific AD user.
$userName = "username"  # Replace with the actual username

Get-ADUser -Identity $userName -Properties msDS-UserPasswordExpiryTimeComputed

Select-Object Name, @{Name="PasswordExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}
