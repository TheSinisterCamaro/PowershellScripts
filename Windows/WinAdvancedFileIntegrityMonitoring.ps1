# Create a new instance of the FileSystemWatcher class to monitor file system changes
$watcher = New-Object System.IO.FileSystemWatcher

# Set the path to the directory that you want to monitor
$watcher.Path = "C:\Path\To\Monitor"

# Set this property to true to include subdirectories within the specified path in the monitoring
$watcher.IncludeSubdirectories = $true

# Enable the FileSystemWatcher to start raising events when changes are detected
$watcher.EnableRaisingEvents = $true

# Register an event handler that will trigger when a file or directory within the monitored path is changed
Register-ObjectEvent $watcher "Changed" -SourceIdentifier FileChanged -Action {
    # Capture the event details when a change is detected
    $event = $Event.SourceEventArgs
    
    # Output the full path of the changed file or directory and the type of change (e.g., Created, Deleted, Modified)
    Write-Output "File $($event.FullPath) changed: $($event.ChangeType)"
}
