$inputFile = "C:\Scripts\computers.txt"
$logFile = "C:\Scripts\ping_results.txt"

"Ping test started at $(Get-Date)" | Out-File $logFile

foreach ($computer in Get-Content $inputFile) {
    if (Test-Connection -ComputerName $computer -Count 1 -Quiet) {
        "$computer is reachable" | Out-File $logFile -Append
    } else {
        "$computer is NOT reachable" | Out-File $logFile -Append
    }
}

"Ping test completed at $(Get-Date)" | Out-File $logFile -Append
