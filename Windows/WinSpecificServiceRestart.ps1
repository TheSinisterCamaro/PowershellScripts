# Specify the name of the service you want to restart
$serviceName = "Spooler"

# Retrieve the status of the specified service
$service = Get-Service -Name $serviceName

# Check if the service is running
if ($service.Status -eq 'Running') {
    # Restart the service if it is running
    Restart-Service -Name $serviceName
    Write-Output "The service '$($serviceName)' was running and has been restarted."
} else {
    # Output a message if the service is not running
    Write-Output "The service '$($serviceName)' is not running, so it cannot be restarted."
}
