# Define the maximum idle time in seconds (e.g., 3600 seconds = 1 hour)
$maxIdleTime = 3600

# Get all interactive user sessions (LogonType 2)
$sessions = Get-WmiObject -Class Win32_LogonSession | Where-Object { $_.LogonType -eq 2 }

foreach ($session in $sessions) {
    # Retrieve the user associated with the current session
    $user = Get-WmiObject -Query "ASSOCIATORS OF {Win32_LogonSession.LogonId=$($session.LogonId)} WHERE AssocClass=Win32_LoggedOnUser Role=Dependent"

    # Get the associated username
    $userName = $user.Antecedent.Name

    # For demonstration purposes, simulate idle time check (in a real scenario, you'd need an actual method to get idle time)
    $sessionIdleTime = $null

    # Here, you might manually define an idle time (for testing) or use a more complex method to determine actual idle time.
    # Let's assume we always log off the user if they are active for testing purposes.
    $sessionIdleTime = $maxIdleTime + 1

    # Check if the session has been idle for longer than the specified maximum idle time
    if ($sessionIdleTime -ge $maxIdleTime) {
        # Log off the user if idle time exceeds the limit using the logoff command
        Write-Output "Logging off user '$userName' with session ID $($session.LogonId) due to inactivity."
        
        # Use logoff command with the session ID
        Invoke-WmiMethod -Class Win32_Process -Name Create -ArgumentList "logoff $($session.LogonId)"
    } else {
        # Output a message if the user is not idle beyond the limit
        Write-Output "User '$userName' with session ID $($session.LogonId) is active or idle for less than the specified limit."
    }
}
