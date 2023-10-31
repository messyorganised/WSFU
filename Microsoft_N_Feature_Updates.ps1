#Install the Windows Update module if it's not present
if (-not (Get-InstalledModule -Name "PSWindowsUpdate" -ErrorAction SilentlyContinue)) {
    Write-Host "
|========================================|

 Installing the PSWindowsUpdate module...

|========================================|
    " -ForegroundColor Yellow
    Install-PackageProvider -Name NuGet -Force
    Install-Module -Name PSWindowsUpdate -Force

    Write-Host "
|==============================|

 Module installed Successfully.

|==============================|
    " -ForegroundColor Green

}
else {
    Write-Host "
|============================================|

 PSWindowsUpdate module is already installed.

|============================================|
    " -ForegroundColor Green
}


#Check and install Feature updates (Upgrades)
Write-Host "
|============================================|

 Checking for Windows and Feature updates...

|============================================|
" -ForegroundColor Yellow

#Check for any updates via PSWindowsUpdate module
$allUpdates = Get-WindowsUpdate 

#if Get-WindowsUpdate equals to greater than zero (-gt 0) run the following command. Else will run the command under it.
if ($allUpdates.Count -gt 0) {
    Write-Host "
|=========================================|

 Installing Windows and Feature updates...

|=========================================|
    " -ForegroundColor Yellow
    Install-WindowsUpdate -AcceptAll -IgnoreReboot
}
else {
    Write-Host "
|=============================================|

 No Windows and Feature updates are available.

|=============================================|
    " -ForegroundColor Green
}

Write-Host "
|=======================================================================|

 Windows Update and Feature updates installation completed successfully.

|=======================================================================|
" -ForegroundColor Green
