@echo off
chcp 65001 >nul
title Universal Exploit Installer v2.1.0
color 0A

echo ========================================
echo Universal Exploit Installer
echo Version: 2.1.0
echo Created by: Mika
echo ========================================
echo.

:menu
cls
echo [MAIN MENU]
echo.
echo 1. Install Exploit (Copy to executor folder)
echo 2. Create Desktop Shortcut
echo 3. Test Installation
echo 4. Update from GitHub
echo 5. Uninstall
echo 6. Exit
echo.
set /p choice="Select option (1-6): "

echo.

if "%choice%"=="1" goto install
if "%choice%"=="2" goto shortcut
if "%choice%"=="3" goto test
if "%choice%"=="4" goto update
if "%choice%"=="5" goto uninstall
if "%choice%"=="6" goto exit
echo Invalid choice! Please try again.
pause
goto menu

:install
cls
echo [INSTALLATION]
echo.
echo This will copy the exploit files to your executor's workspace.
echo.
echo Available executors:
echo 1. Synapse X
echo 2. KRNL
echo 3. Script-Ware
echo 4. Fluxus
echo 5. Custom folder
echo.
set /p executor="Select executor (1-5): "

echo.

if "%executor%"=="1" (
    set "target_folder=%appdata%\Synapse\workspace"
    echo Selected: Synapse X
) else if "%executor%"=="2" (
    set "target_folder=%localappdata%\KRNL\workspace"
    echo Selected: KRNL
) else if "%executor%"=="3" (
    set "target_folder=%appdata%\Script-Ware\workspace"
    echo Selected: Script-Ware
) else if "%executor%"=="4" (
    set "target_folder=%localappdata%\Fluxus\workspace"
    echo Selected: Fluxus
) else if "%executor%"=="5" (
    set /p target_folder="Enter custom folder path: "
    echo Selected: Custom folder
) else (
    echo Invalid selection!
    pause
goto install
)

echo.
echo Target folder: %target_folder%
echo.

if not exist "%target_folder%" (
    echo Creating target folder...
    mkdir "%target_folder%"
)

echo Copying files...

if exist "UniversalExploit.lua" (
    copy "UniversalExploit.lua" "%target_folder%\" >nul
    echo ✓ UniversalExploit.lua
) else (
    echo ✗ UniversalExploit.lua not found!
)

if exist "Loader.lua" (
    copy "Loader.lua" "%target_folder%\" >nul
    echo ✓ Loader.lua
) else (
    echo ✗ Loader.lua not found!
)

if exist "Config.lua" (
    copy "Config.lua" "%target_folder%\" >nul
    echo ✓ Config.lua
) else (
    echo ✗ Config.lua not found!
)

if exist "README.md" (
    copy "README.md" "%target_folder%\" >nul
    echo ✓ README.md
) else (
    echo ✗ README.md not found!
)

echo.
echo Installation complete!
echo.
echo Instructions:
echo 1. Open your executor (Synapse/KRNL/etc.)
echo 2. Attach to Roblox
echo 3. Execute Loader.lua
echo 4. Press RightControl to open menu
echo.
pause
goto menu

:shortcut
cls
echo [DESKTOP SHORTCUT]
echo.
echo Creating desktop shortcut...
echo.

set "desktop=%userprofile%\Desktop"
set "shortcut_path=%desktop%\Universal Exploit.lnk"

if exist "%shortcut_path%" (
    del "%shortcut_path%"
    echo Old shortcut removed.
)

(
echo Set oWS = WScript.CreateObject("WScript.Shell")
echo sLinkFile = "%shortcut_path%"
echo Set oLink = oWS.CreateShortcut(sLinkFile)
echo oLink.TargetPath = "%cd%\Loader.lua"
echo oLink.Arguments = ""
echo oLink.Description = "Universal Roblox Exploit"
echo oLink.WorkingDirectory = "%cd%"
echo oLink.Save
) > "%temp%\create_shortcut.vbs"

cscript //nologo "%temp%\create_shortcut.vbs"
del "%temp%\create_shortcut.vbs"

echo Shortcut created on desktop!
echo.
echo Double-click "Universal Exploit" on your desktop
echo to quickly open the loader.
echo.
pause
goto menu

:test
cls
echo [TEST INSTALLATION]
echo.
echo Testing exploit files...
echo.

set "test_passed=1"

if exist "UniversalExploit.lua" (
    echo ✓ UniversalExploit.lua found
    for /f %%i in ('find /c /v "" ^< "UniversalExploit.lua"') do set lines=%%i
    echo   Lines: %lines%
    for /f %%i in ('powershell -Command "(Get-Content 'UniversalExploit.lua' -Raw).Length"') do set chars=%%i
    echo   Characters: %chars%
) else (
    echo ✗ UniversalExploit.lua missing!
    set "test_passed=0"
)

echo.

if exist "Loader.lua" (
    echo ✓ Loader.lua found
    for /f %%i in ('find /c /v "" ^< "Loader.lua"') do set lines=%%i
    echo   Lines: %lines%
) else (
    echo ✗ Loader.lua missing!
    set "test_passed=0"
)

echo.

if exist "Config.lua" (
    echo ✓ Config.lua found
    for /f %%i in ('find /c /v "" ^< "Config.lua"') do set lines=%%i
    echo   Lines: %lines%
) else (
    echo ✗ Config.lua missing!
    set "test_passed=0"
)

echo.

if exist "README.md" (
    echo ✓ README.md found
    for /f %%i in ('find /c /v "" ^< "README.md"') do set lines=%%i
    echo   Lines: %lines%
) else (
    echo ✗ README.md missing!
    set "test_passed=0"
)

echo.

if "%test_passed%"=="1" (
    echo ✅ All files present and valid!
    echo.
    echo Installation test passed successfully.
) else (
    echo ❌ Some files are missing!
    echo.
    echo Please run option 1 (Install) first.
)

echo.
pause
goto menu

:update
cls
echo [UPDATE FROM GITHUB]
echo.
echo This feature requires internet connection.
echo.
echo WARNING: This will overwrite existing files!
echo.
set /p confirm="Continue? (y/n): "

if /i not "%confirm%"=="y" goto menu

echo.
echo Downloading latest version...
echo.

if not exist "%temp%\ue_update" mkdir "%temp%\ue_update"

curl -L -o "%temp%\ue_update\UniversalExploit.lua" "https://raw.githubusercontent.com/example/UniversalExploit/main/UniversalExploit.lua"
if errorlevel 1 (
    echo ✗ Failed to download UniversalExploit.lua
) else (
    echo ✓ Downloaded UniversalExploit.lua
)

curl -L -o "%temp%\ue_update\Loader.lua" "https://raw.githubusercontent.com/example/UniversalExploit/main/Loader.lua"
if errorlevel 1 (
    echo ✗ Failed to download Loader.lua
) else (
    echo ✓ Downloaded Loader.lua
)

curl -L -o "%temp%\ue_update\Config.lua" "https://raw.githubusercontent.com/example/UniversalExploit/main/Config.lua"
if errorlevel 1 (
    echo ✗ Failed to download Config.lua
) else (
    echo ✓ Downloaded Config.lua
)

curl -L -o "%temp%\ue_update\README.md" "https://raw.githubusercontent.com/example/UniversalExploit/main/README.md"
if errorlevel 1 (
    echo ✗ Failed to download README.md
) else (
    echo ✓ Downloaded README.md
)

echo.
echo Updating local files...
echo.

copy "%temp%\ue_update\UniversalExploit.lua" . >nul
if errorlevel 1 (
    echo ✗ Failed to update UniversalExploit.lua
) else (
    echo ✓ Updated UniversalExploit.lua
)

copy "%temp%\ue_update\Loader.lua" . >nul
if errorlevel 1 (
    echo ✗ Failed to update Loader.lua
) else (
    echo ✓ Updated Loader.lua
)

copy "%temp%\ue_update\Config.lua" . >nul
if errorlevel 1 (
    echo ✗ Failed to update Config.lua
) else (
    echo ✓ Updated Config.lua
)

copy "%temp%\ue_update\README.md" . >nul
if errorlevel 1 (
    echo ✗ Failed to update README.md
) else (
    echo ✓ Updated README.md
)

rmdir /s /q "%temp%\ue_update"

echo.
echo Update complete!
echo.
pause
goto menu

:uninstall
cls
echo [UNINSTALL]
echo.
echo WARNING: This will remove all exploit files!
echo.
set /p confirm="Are you sure? (y/n): "

if /i not "%confirm%"=="y" goto menu

echo.
echo Removing files...
echo.

if exist "UniversalExploit.lua" (
    del "UniversalExploit.lua"
    echo ✓ Removed UniversalExploit.lua
) else (
    echo ✗ UniversalExploit.lua not found
)

if exist "Loader.lua" (
    del "Loader.lua"
    echo ✓ Removed Loader.lua
) else (
    echo ✗ Loader.lua not found
)

if exist "Config.lua" (
    del "Config.lua"
    echo ✓ Removed Config.lua
) else (
    echo ✗ Config.lua not found
)

if exist "README.md" (
    del "README.md"
    echo ✓ Removed README.md
) else (
    echo ✗ README.md not found
)

if exist "TestExploit.lua" (
    del "TestExploit.lua"
    echo ✓ Removed TestExploit.lua
)

if exist "ExampleUsage.lua" (
    del "ExampleUsage.lua"
    echo ✓ Removed ExampleUsage.lua
)

if exist "Install.bat" (
    echo.
    echo Note: Install.bat will not be removed.
    echo You can delete it manually if needed.
)

echo.
echo Uninstall complete!
echo All exploit files have been removed.
echo.
pause
goto menu

:exit
cls
echo ========================================
echo Thank you for using Universal Exploit!
echo Created by Mika
echo ========================================
echo.
pause
exit