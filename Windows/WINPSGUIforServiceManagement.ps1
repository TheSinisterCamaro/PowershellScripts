# Load the necessary assembly for Windows Forms
Add-Type -AssemblyName System.Windows.Forms

# Create the form
$form = New-Object system.Windows.Forms.Form
$form.Text = "Service Manager"
$form.Size = New-Object System.Drawing.Size(400,200)

# Create a label
$label = New-Object system.Windows.Forms.Label
$label.Text = "Enter Service Name:"
$label.AutoSize = $true
$label.Location = New-Object System.Drawing.Point(10,20)
$form.Controls.Add($label)

# Create a textbox for service name input
$serviceNameTextBox = New-Object system.Windows.Forms.TextBox
$serviceNameTextBox.Location = New-Object System.Drawing.Point(150,20)
$serviceNameTextBox.Width = 200
$form.Controls.Add($serviceNameTextBox)

# Create a button to check service status
$statusButton = New-Object system.Windows.Forms.Button
$statusButton.Text = "Check Status"
$statusButton.Location = New-Object System.Drawing.Point(10,60)
$statusButton.Width = 100
$form.Controls.Add($statusButton)

# Create a button to start the service
$startButton = New-Object system.Windows.Forms.Button
$startButton.Text = "Start Service"
$startButton.Location = New-Object System.Drawing.Point(120,60)
$startButton.Width = 100
$form.Controls.Add($startButton)

# Create a button to stop the service
$stopButton = New-Object system.Windows.Forms.Button
$stopButton.Text = "Stop Service"
$stopButton.Location = New-Object System.Drawing.Point(230,60)
$stopButton.Width = 100
$form.Controls.Add($stopButton)

# Create a label to display results
$resultLabel = New-Object system.Windows.Forms.Label
$resultLabel.AutoSize = $true
$resultLabel.Location = New-Object System.Drawing.Point(10,100)
$form.Controls.Add($resultLabel)

# Define the action for the "Check Status" button
$statusButton.Add_Click({
    $serviceName = $serviceNameTextBox.Text
    if ($serviceName) {
        $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
        if ($service) {
            $resultLabel.Text = "Service '$serviceName' is $($service.Status)"
        } else {
            $resultLabel.Text = "Service '$serviceName' not found."
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Please enter a service name.", "Error")
    }
})

# Define the action for the "Start Service" button
$startButton.Add_Click({
    $serviceName = $serviceNameTextBox.Text
    if ($serviceName) {
        $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
        if ($service -and $service.Status -ne 'Running') {
            Start-Service -Name $serviceName
            $resultLabel.Text = "Service '$serviceName' started."
        } elseif ($service.Status -eq 'Running') {
            $resultLabel.Text = "Service '$serviceName' is already running."
        } else {
            $resultLabel.Text = "Service '$serviceName' not found."
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Please enter a service name.", "Error")
    }
})

# Define the action for the "Stop Service" button
$stopButton.Add_Click({
    $serviceName = $serviceNameTextBox.Text
    if ($serviceName) {
        $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
        if ($service -and $service.Status -ne 'Stopped') {
            Stop-Service -Name $serviceName
            $resultLabel.Text = "Service '$serviceName' stopped."
        } elseif ($service.Status -eq 'Stopped') {
            $resultLabel.Text = "Service '$serviceName' is already stopped."
        } else {
            $resultLabel.Text = "Service '$serviceName' not found."
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Please enter a service name.", "Error")
    }
})

# Show the form
$form.ShowDialog()
