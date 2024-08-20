# Script to create a scheduled task

# Define the action for the scheduled task, specifying the executable (PowerShell.exe) 
# and the arguments, which include the path to the script to be executed
$action = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument '-File C:\Path\To\YourScript.ps1'

# Define the trigger for the scheduled task, setting it to run daily at 6:00 AM
$trigger = New-ScheduledTaskTrigger -Daily -At 6am

# Register the scheduled task with the specified action and trigger, giving it a name ("DailyTask")
# and a description ("Runs a daily task at 6am")
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "DailyTask" -Description "Runs a daily task at 6am."
