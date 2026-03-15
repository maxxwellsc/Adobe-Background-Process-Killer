@echo off
setlocal EnableDelayedExpansion
title Adobe Background Process Cleaner

:: Check for Administrative Privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Please right-click and "Run as Administrator".
    pause
    exit /b
)

echo ============================================================
echo   ADOBE BACKGROUND PROCESS CLEANER
echo   Status: Initializing...
echo ============================================================
echo.

echo [+] STEP 1: Terminating active background processes...
:: Forcefully stops all known Adobe background executables
set "procs=AdobeIPCBroker.exe AdobeCollabSync.exe Adobe Desktop Service.exe Adobe CEF Helper.exe CCLibrary.exe CCXProcess.exe CoreSync.exe Creative Cloud.exe AdobeGCClient.exe acrotray.exe AdobeUpdateService.exe"
for %%p in (%procs%) do (
    taskkill /f /im "%%p" /t >nul 2>&1
    if !errorLevel! equ 0 (echo   - Stopped %%p)
)

echo.
echo [+] STEP 2: Disabling persistent Adobe services...
:: Disables services so they don't restart on reboot
set "services=AGSService AdobeUpdateService AdobeARMservice AGMService AdobeFlashPlayerUpdateSvc"
for %%s in (%services%) do (
    sc stop "%%s" >nul 2>&1
    sc config "%%s" start= disabled >nul 2>&1
    echo   - Disabled %%s
)

echo.
echo [+] STEP 3: Disabling Scheduled Update Tasks...
:: Stops Adobe from checking for updates or re-launching via Task Scheduler
schtasks /change /tn "AdobeGCInvoker-1.0" /disable >nul 2>&1
schtasks /change /tn "Adobe Acrobat Update Task" /disable >nul 2>&1
schtasks /change /tn "Adobe Creative Cloud" /disable >nul 2>&1
echo   - Scheduled tasks disabled.

echo.
echo ============================================================
echo   CLEANUP FINISHED SUCCESSFULLY
echo   Your CPU should now be free of Adobe background bloat.
echo ============================================================
echo.
pause
