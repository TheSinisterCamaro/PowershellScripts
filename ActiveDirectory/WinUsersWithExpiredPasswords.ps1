# This script finds and displays all users with expired passwords.
Get-ADUser -Filter * -Property "msDS-UserPasswordExpiryTimeComputed"

Where-Object {([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")) -lt (Get-Date)}

Select-Object Name, SamAccountName, @{Name="PasswordExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}
