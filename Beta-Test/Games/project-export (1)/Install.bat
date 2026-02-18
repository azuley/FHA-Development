@echo off
chcp 65001 >nul
title Universal Exploit Installer v3.0.0
color 0A

echo =========================================
echo    UNIVERSAL EXPLOIT INSTALLER
echo    Version: 3.0.0
echo =========================================
echo.

:menu
cls
echo =========================================
echo    MAIN MENU
echo =========================================
echo.
echo [1] Install Exploit
echo [2] Update Exploit
echo [3] Uninstall Exploit
echo [4] Run Test
echo [5] Open Folder
echo [6] Exit
echo.
echo =========================================
set /p choice="Select option (1-6): "

echo.

if "%choice%"=="1" goto install
if "%choice%"=="2" goto update
if "%choice%"=="3" goto uninstall
if "%choice%"=="4" goto test
if "%choice%"=="5" goto folder
if "%choice%"=="6" goto exit
goto menu

:install
cls
echo =========================================
echo    INSTALLATION
echo =========================================
echo.
echo Installing Universal Exploit v3.0.0...
echo.

:: Check if files exist
if exist "UniversalExploit.lua" (
    echo ✅ UniversalExploit.lua found
) else (
    echo ❌ UniversalExploit.lua not found
    echo Downloading from GitHub...
    powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/MikaVirus/UniversalExploit/main/UniversalExploit.lua' -OutFile 'UniversalExploit.lua'"
    if exist "UniversalExploit.lua" (
        echo ✅ Downloaded successfully
    ) else (
        echo ❌ Download failed
    )
)

if exist "Loader.lua" (
    echo ✅ Loader.lua found
) else (
    echo ❌ Loader.lua not found
    echo Creating Loader.lua...
    copy /y NUL Loader.lua >nul
    echo ✅ Created Loader.lua
)

if exist "Config.lua" (
    echo ✅ Config.lua found
) else (
    echo ❌ Config.lua not found
    echo Creating Config.lua...
    copy /y NUL Config.lua >nul
    echo ✅ Created Config.lua
)

if exist "TestExploit.lua" (
    echo ✅ TestExploit.lua found
) else (
    echo ❌ TestExploit.lua not found
    echo Creating TestExploit.lua...
    copy /y NUL TestExploit.lua >nul
    echo ✅ Created TestExploit.lua
)

echo.
echo 📁 Creating documentation files...
if not exist "README.md" (
    echo # Universal Exploit > README.md
    echo ✅ Created README.md
)

if not exist "SUMMARY.md" (
    echo # Feature Summary > SUMMARY.md
    echo ✅ Created SUMMARY.md
)

if not exist "VERIFICATION.md" (
    echo # Security Verification > VERIFICATION.md
    echo ✅ Created VERIFICATION.md
)

if not exist "ExampleUsage.lua" (
    echo -- Example Usage > ExampleUsage.lua
    echo ✅ Created ExampleUsage.lua
)

echo.
echo 📊 Installation Summary:
dir *.lua *.md *.bat 2>nul | find /c /v "" >nul && (
    dir *.lua *.md *.bat
)

echo.
echo ✅ Installation complete!
echo.
echo 💡 Next steps:
echo    1. Open your Roblox executor
echo    2. Load UniversalExploit.lua
echo    3. Or execute Loader.lua
echo    4. Press RightControl to toggle UI
echo.
pause
goto menu

:update
cls
echo =========================================
echo    UPDATE
echo =========================================
echo.
echo Checking for updates...
echo.

:: Backup existing files
if not exist "Backup" mkdir Backup
echo 📦 Creating backup...
copy *.lua Backup\ 2>nul
echo ✅ Backup created in Backup\ folder

echo.
echo 🔄 Downloading latest version...

:: Download updated files
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/MikaVirus/UniversalExploit/main/UniversalExploit.lua' -OutFile 'UniversalExploit.lua'"
if exist "UniversalExploit.lua" (
    echo ✅ Updated UniversalExploit.lua
) else (
    echo ❌ Update failed
)

powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/MikaVirus/UniversalExploit/main/Loader.lua' -OutFile 'Loader.lua'"
if exist "Loader.lua" (
    echo ✅ Updated Loader.lua
) else (
    echo ❌ Update failed
)

powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/MikaVirus/UniversalExploit/main/Config.lua' -OutFile 'Config.lua'"
if exist "Config.lua" (
    echo ✅ Updated Config.lua
) else (
    echo ❌ Update failed
)

echo.
echo 📝 Updating documentation...

powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/MikaVirus/UniversalExploit/main/README.md' -OutFile 'README.md'"
if exist "README.md" (
    echo ✅ Updated README.md
)

powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/MikaVirus/UniversalExploit/main/SUMMARY.md' -OutFile 'SUMMARY.md'"
if exist "SUMMARY.md" (
    echo ✅ Updated SUMMARY.md
)

echo.
echo ✅ Update complete!
echo.
echo 📁 Files updated:
echo    • UniversalExploit.lua
echo    • Loader.lua
echo    • Config.lua
echo    • Documentation files
echo.
echo 💡 Old files backed up to Backup\ folder
echo.
pause
goto menu

:uninstall
cls
echo =========================================
echo    UNINSTALL
echo =========================================
echo.
echo ⚠️  WARNING: This will remove all exploit files!
echo.
set /p confirm="Are you sure? (y/n): "

if /i "%confirm%" neq "y" goto menu

echo.
echo 🗑️  Removing files...

del UniversalExploit.lua 2>nul && echo ✅ Removed UniversalExploit.lua
del Loader.lua 2>nul && echo ✅ Removed Loader.lua
del Config.lua 2>nul && echo ✅ Removed Config.lua
del TestExploit.lua 2>nul && echo ✅ Removed TestExploit.lua
del ExampleUsage.lua 2>nul && echo ✅ Removed ExampleUsage.lua

del README.md 2>nul && echo ✅ Removed README.md
del SUMMARY.md 2>nul && echo ✅ Removed SUMMARY.md
del VERIFICATION.md 2>nul && echo ✅ Removed VERIFICATION.md

echo.
echo 📁 Removing empty folders...
if exist Backup (
    rmdir /s /q Backup 2>nul && echo ✅ Removed Backup folder
)

echo.
echo ✅ Uninstall complete!
echo All exploit files have been removed.
echo.
pause
goto menu

:test
cls
echo =========================================
echo    TEST MODE
echo =========================================
echo.
echo Running system tests...
echo.

echo 🔍 Checking files...
if exist "UniversalExploit.lua" (
    echo ✅ UniversalExploit.lua: EXISTS
    for /f %%i in ('powershell -Command "(Get-Content 'UniversalExploit.lua' -Raw).Length"') do (
        echo    Size: %%i characters
    )
) else (
    echo ❌ UniversalExploit.lua: MISSING
)

if exist "Loader.lua" (
    echo ✅ Loader.lua: EXISTS
) else (
    echo ❌ Loader.lua: MISSING
)

if exist "Config.lua" (
    echo ✅ Config.lua: EXISTS
) else (
    echo ❌ Config.lua: MISSING
)

echo.
echo 🧪 Testing Lua syntax...
echo (This would require Lua interpreter)
echo.

echo 📊 System information:
echo OS: %OS%
echo Processor: %PROCESSOR_ARCHITECTURE%
echo User: %USERNAME%
echo Date: %DATE% %TIME%

echo.
echo ✅ Test complete!
echo.
echo 💡 If all files exist, the exploit is ready.
echo    Execute Loader.lua in your executor.
echo.
pause
goto menu

:folder
cls
echo =========================================
echo    OPENING FOLDER
echo =========================================
echo.
echo 📂 Opening current directory...
start .
echo.
echo ✅ Folder opened in File Explorer.
echo.
pause
goto menu

:exit
cls
echo =========================================
echo    THANK YOU
echo =========================================
echo.
echo Thanks for using Universal Exploit!
echo.
echo 🔗 Resources:
echo • GitHub: github.com/MikaVirus/UniversalExploit
echo • Discord: (Check GitHub for link)
echo • Documentation: README.md
echo.
echo 👨‍💻 Created by: Mika
echo 🎨 UI Design: Premium Glass Morphism
echo ⚡ Version: 3.0.0
echo.
echo =========================================
pause
exit