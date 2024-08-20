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

# Loop through each group and user and add the user to the group
foreach ($group_name in $group_names) {
    # Check if the group name is in the allowed list (Make sure file path is set to the same location as above)
    if (Get-Content -Path "allowed_groups.txt" | Select-Object -Unique | Where-Object {$_ -eq $group_name}) {
        foreach ($user_name in $user_names) {
            $user = Get-ADUser $user_name
            $group = Get-ADGroup $group_name
            Add-ADGroupMember $group -Members $user_names_input
            Write-Host "The user $($user_name) has been added to the group $($group_name)."
        }
    } else {
            Write-Host "The group $($group_name) is not in the list of allowed groups."
    }
}

#
#
# Extra notes on how to connecto to Paragon in order to change user's security via a powershell script for a more streamlined process
# 
# 1. Establish a connection to the Paragon system using PowerShell. This may involve using a module specific to the system or using standard PowerShell cmdlets such as Invoke-WebRequest or Invoke-RestMethod.
#
# 2. Once you have established a connection, identify the specific endpoint or API that allows you to modify user profiles and determine the format of the data that needs to be submitted to the system. This will likely involve sending an HTTP POST request to the appropriate endpoint with the relevant data.
#
# 3. Construct the necessary data structure in PowerShell, including the user's username and the list of groups that you want to add to their profile. This may involve creating a PowerShell object with properties for each piece of data.
#
# 4. Use PowerShell to submit the data to the appropriate endpoint in the Paragon system. This may involve using the Invoke-WebRequest or Invoke-RestMethod cmdlets in PowerShell to send an HTTP POST request with the data included in the request body.
#
# 5. Verify that the user's profile has been updated with the new groups by checking the appropriate endpoint in the system or by retrieving the user's profile through PowerShell.
#
#