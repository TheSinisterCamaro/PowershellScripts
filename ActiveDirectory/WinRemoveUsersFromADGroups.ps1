# Get a list of groups that the security administrator has access to move (Replace with user's AD info CN=SecurityAdmin,CN=Users,DC=Contoso,DC=com)
$allowed_groups = Get-ADGroup -Filter * -Properties ManagedBy | Where-Object {$_.ManagedBy -like "*CN=SecurityAdmin,CN=Users,DC=Contoso,DC=com*"} | Select-Object Name

# Write the group names to a text file, overwriting the file if it already exists to keep an updated list (Set the file path to where you want to the text file stored)
$allowed_groups | Select-Object -ExpandProperty Name | Out-File -FilePath "allowed_groups.txt" -Force

# Prompt the user to enter a comma-sparated list of groups names
$group_names_input = Read-Host "Enter a list of group names (separated by commas)"

# Convert the input string to an array of group names
$group_names = $group_names_input -split ','

# Prompt user to to enter a comma-separated list of user names
$user_names_input = Read-Host "Enter a list of user names (separated by commas)"

# Convert the input string to an array of user names
$user_names = $user_names_input -split ','

# Loop through each user and group and remove the user from the group
foreach ($user_name in $user_names) {
    $user = Get-ADUser $user_name

    foreach ($group_name in $group_names) {
        # Check if the group name is in the allowed list (Make sure file path is set to the same location as above)
        if (Get-Content -Path "allowed_groups.txt" | Select-Object -Unique | Where-Object {$_ -eq $group_name}) {
            $group = Get-ADGroup $group_name
            if (Get-ADGroupMember $group | Where-Object {$_.samAcountName -eq $user_name}) {
                Remove-ADGroupMember $group -Members $user -Confirm:$false
                Write-Host "The user $($user_name) has been removed from the group $($group_name)."
            } else {
                    Write-Host "The user $($user_name) is not a member of the group $($group_name)."
            }
        } else {
            Write-Host "The group $($group_name) is not in the list of allowed groups."
        }
    }
}
