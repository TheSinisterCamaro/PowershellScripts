# Specify the name of the service you want to start
$serviceName = "Spooler"

# Start the specified service
Start-Service -Name $serviceName

# Output a confirmation message
Write-Output "The service '$($serviceName)' has been started."
