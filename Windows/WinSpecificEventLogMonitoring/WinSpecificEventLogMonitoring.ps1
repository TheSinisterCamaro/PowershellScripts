# This script monitors the Security Event Log for failed login attempts.

# Define the event ID for failed login attempts
$eventID = 4625

# Monitor the Security log
Get-EventLog -LogName Security -InstanceId $eventID -Newest 10 |
ForEach-Object {
    # Extract relevant information from each event log entry
    $entry = $_
    $timestamp = $entry.TimeGenerated
    $username = $entry.ReplacementStrings[5]  # The username involved in the failed attempt
    $workstation = $entry.ReplacementStrings[11]  # The workstation name
    $message = $entry.Message

    # Output the detailed information
    Write-Output "Failed login attempt detected:"
    Write-Output "Time: $timestamp"
    Write-Output "Username: $username"
    Write-Output "Workstation: $workstation"
    Write-Output "Message: $message"
    Write-Output "------------------------------------"
}
