$dirs = Get-ChildItem -Directory
Write-Host "=== Available packer builds: ==="
for ($i = 0; $i -lt $dirs.Length; $i++) {
    Write-Host "${i}: $($dirs[$i].Name)"
}
Write-Host "=================================="
$selection = Read-Host "Enter the number of the packer build to run"
Write-Host "=================================="
if (-not (Test-Path env.json)) {
    Write-Error "env.json not found, exiting"
    Write-Debug "env.json.template should be copied to env.json and updated with the correct values"
    exit 1
}
$dir = $dirs[$selection]
Write-Host "Building $dir"
Set-Location $dir
try {
    packer build -force -var-file ..\env.json .
    Set-Location ..
}
catch {
    Write-Error "Error building $dir, exiting"
    Set-Location ..
    exit 1
}