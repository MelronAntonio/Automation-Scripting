# cpu_monitor.ps1
# Description: Logs CPU usage every 5 seconds to a file

$LogFile = "C:\Logs\CPU_Usage.txt"

# Create Logs directory if it doesn't exist
if (!(Test-Path "C:\Logs")) {
    New-Item -ItemType Directory -Path "C:\Logs"
}

while ($true) {
    $CPU = Get-Counter '\Processor(_Total)\% Processor Time'
    $Usage = [math]::Round($CPU.CounterSamples.CookedValue, 2)
    $Time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$Time - CPU Usage: $Usage%" | Out-File -FilePath $LogFile -Append
    Start-Sleep -Seconds 5
}
