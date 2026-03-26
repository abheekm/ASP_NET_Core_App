Write-Host "Hello from PowerShell CI runner (Windows)"

Write-Host "Computer: $env:COMPUTERNAME"
Write-Host "User: $env:USERNAME"
Write-Host "OS: $env:OS"

$file = "ci_test.txt"
"CI Runner Test" | Out-File $file

Get-Content $file

Remove-Item $file

for ($i = 1; $i -le 5; $i++) {
    Write-Host "Iteration $i"
    Start-Sleep -Seconds 1
}

try {
    Get-Item "non_existing_file.txt"
}
catch {
    Write-Host "Error handled correctly"
}

Write-Host "Running ipconfig"
ipconfig | Select-Object -First 5

Test-Connection -ComputerName google.com -Count 2

Write-Host "Starting CI simulation"

$artifact = "artifact.txt"
"Build output" | Out-File $artifact

if (!(Test-Path $artifact)) {
    Write-Error "Build failed"
    exit 1
}

Write-Host "Running tests"
Start-Sleep 2

Write-Host "Publishing artifact"
Get-Content $artifact

Remove-Item $artifact
Write-Host "CI pipeline completed successfully"