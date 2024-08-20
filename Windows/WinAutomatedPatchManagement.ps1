# Ensure the PSWindowsUpdate module is imported
Import-Module PSWindowsUpdate

# Check for updates
$updates = Get-WindowsUpdate -AcceptAll -Install -AutoReboot

# Output the update status
if ($updates) {
    Write-Output "Updates installed successfully. A reboot may be required."
} else {
    Write-Output "No updates were installed."
}

# Custom function to check for pending reboot
function Test-PendingReboot {
    $rebootRequired = $false

    # Check if the Windows Update requires a reboot
    $windowsUpdateKey = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired'
    if (Test-Path $windowsUpdateKey) {
        $rebootRequired = $true
    }

    # Check if a component-based servicing (CBS) reboot is required
    $cbsKey = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending'
    if (Test-Path $cbsKey) {
        $rebootRequired = $true
    }

    # Check if there are pending file rename operations
    $pendingFileRenameKey = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\PendingFileRenameOperations'
    if (Test-Path $pendingFileRenameKey) {
        $rebootRequired = $true
    }

    return $rebootRequired
}

# Check if a reboot is required and perform it
if (Test-PendingReboot) {
    Restart-Computer -Force
} else {
    Write-Output "No reboot is required."
}
