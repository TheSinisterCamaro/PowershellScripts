# Specify the name of the service you want to stop
$serviceName = "Spooler"

# Stop the specified service
Stop-Service -Name $serviceName

# Output a confirmation message
Write-Output "The service '$($serviceName)' has been stopped."
