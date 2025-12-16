Write-Host "Hello from PowerShell 7 on Windows"
Write-Host "OS:" $PSVersionTable.OS

Write-Host "CI:" $env:CI
Write-Host "User:" $env:USERNAME
Write-Host "Temp:" $env:TEMP

$dir = "ci-test"
New-Item -ItemType Directory -Path $dir -Force | Out-Null

1..5 | ForEach-Object {
    "File $_" | Out-File "$dir/file$_.txt"
}

(Get-ChildItem $dir).Count
Remove-Item $dir -Recurse -Force

$proc = Start-Process pwsh `
    -ArgumentList '-Command "Write-Output ''Child process works''"' `
    -NoNewWindow -PassThru -Wait

Write-Host "Exit code:" $proc.ExitCode

$jobs = 1..5 | ForEach-Object {
    Start-Job -ScriptBlock {
        Start-Sleep -Seconds (Get-Random -Min 1 -Max 3)
        "Job $using:_ done"
    }
}

$results = Receive-Job -Job $jobs -Wait
$results | Out-File result.txt

Get-Content result.txt
Remove-Job $jobs

try {
    Write-Host "Starting risky operation..."
    Get-Item "C:\this-path-does-not-exist" -ErrorAction Stop
}
catch {
    Write-Error "Handled error: $_"
}