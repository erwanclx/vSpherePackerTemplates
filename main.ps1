$dirs = Get-ChildItem -Directory
Write-Host "=== Available packer builds: ==="
for ($i = 0; $i -lt $dirs.Length; $i++) {
    Write-Host "${i}: $($dirs[$i].Name)"
}
Write-Host "=================================="
$selection = Read-Host "Enter the number of the packer build to run or 'a' to run all"
Write-Host "=================================="
if (-not (Test-Path env.json)) {
    Write-Error "env.json not found, exiting"
    Write-Debug "env.json.template should be copied to env.json and updated with the correct values"
    exit 1
}

function build {
    param(
        [string]$dir
    )
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
}

if ($selection -eq 'a') {
    foreach ($dir in $dirs) {
        build $dir
    }
}
else {
    if ($selection -lt 0 -or $selection -ge $dirs.Length) {
        Write-Error "Invalid selection, exiting"
        exit 1
    }
    $dir = $dirs[$selection]
    build $dir
    # Write-Host "Building $dir"
    # Set-Location $dir
    # try {
    #     packer build -force -var-file ..\env.json .
    #     Set-Location ..
    # }
    # catch {
    #     Write-Error "Error building $dir, exiting"
    #     Set-Location ..
    #     exit 1
    # }
}