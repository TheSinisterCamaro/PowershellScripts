# This script performs an automated backup of critical system files.

# Define backup source and destination
$source = "C:\\CriticalFiles"
$destination = "D:\\Backups\\CriticalFiles_$(Get-Date -Format 'yyyyMMdd').zip"

# Create a backup
Compress-Archive -Path $source -DestinationPath $destination

# Confirm backup success
if (Test-Path $destination) {
    Write-Output "Backup created successfully at $destination"
} else {
    Write-Output "Backup failed."
}

# Restore files (uncomment the following lines to enable restore functionality)
# $restoreDestination = "C:\\RestoredFiles"
# Expand-Archive -Path $destination -DestinationPath $restoreDestination
# Write-Output "Files restored to $restoreDestination"
