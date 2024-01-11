@echo off
TITLE Samsung Notes for windows installer by Vince
chcp 936
color b
:start
cls
color b
echo  Samsung Notes for windows installer by Vince
ECHO. =============================================================================
echo  Samsung Notes version: 4.3.182.0(local)
echo  Samsung Account version: 1.23.2070.0(local)
echo  Galaxybook Mask: https://github.com/kellwinr/galaxybook_mask
echo  GitHub: https://github.com/vinceying
ECHO. =============================================================================
echo.
echo  1. Install Samsung Notes and Samsung Account(lacal)
echo.
echo  2. Install Samsung Notes and Samsung Account(online)
echo.
echo  3. Galaxybook Mask(Startup)
echo.
echo  4. Galaxybook Mask(Non-startup)
echo.
echo  5. Galaxybook Mask(Direct launch)
echo.
echo  6. Uninstall Samsung Notes and Samsung Account
echo.
echo  7. Generate desktop shortcut(by Direct launch)
echo. 
set /p Choice=Please select the serial number to start: 
if /I "%Choice%"=="" goto start
if /I "%Choice%"=="1" goto lacal
if /I "%Choice%"=="2" goto online
if /I "%Choice%"=="3" goto startup
if /I "%Choice%"=="4" goto nostartup
if /I "%Choice%"=="5" goto direct
if /I "%Choice%"=="6" goto uninstall
if /I "%Choice%"=="7" goto desktop
goto start

:lacal
cls
echo Install Samsung Notes and Samsung Account(lacal)
echo Please download SamsungNotes.Msixbundle and SamsungAccounts.Msixbundle into aapx folder（Dn not rename!）
echo Installing(Turn on sideloading before install https://learn.microsoft.com/zh-cn/windows/application-management/sideload-apps-in-windows)
start %cd%\aapx\SamsungNotes.Msixbundle
start %cd%\aapx\SamsungAccount.Msixbundle
echo.
echo Press any key to continue
pause>nul
cls
goto start

:online
cls
echo install Samsung Notes and Samsung Account(online)
echo installing(Use the winget tool to install https://learn.microsoft.com/en-us/windows/package-manager/winget/)
winget install "Samsung Notes"
winget install "Samsung Account"
echo.
echo Press any key to continue
pause>nul
cls
goto start

:startup
cls
echo Galaxybook Mask(Startup)
echo Galaxybook Mask(https://github.com/kellwinr/galaxybook_mask)
start %cd%\galaxybook_mask\GalaxyBookMask.bat
echo.
echo Press any key to continue
pause>nul
cls
goto start

:nostartup
cls
echo Galaxybook Mask(Non-startup)
echo Galaxybook Mask(https://github.com/kellwinr/galaxybook_mask)
start %cd%\galaxybook_mask\GalaxyBookMask (no startup).bat
echo.
echo Press any key to continue
pause>nul
cls
goto start

:direct
cls
echo Galaxybook Mask(Direct launch)
echo Galaxybook Mask(https://github.com/kellwinr/galaxybook_mask)
start %cd%\galaxybook_mask\samsungnotes-directlaunch.bat
echo.
echo Press any key to continue
pause>nul
cls
goto start

:uninstall
cls
echo Uninstall Samsung Notes and Samsung Account
echo Uninstalling(Use the winget tool to uninstall https://learn.microsoft.com/en-us/windows/package-manager/winget/)
winget uninstall "Samsung Notes"
winget uninstall "Samsung Account"
echo.
echo Press any key to continue
pause>nul
cls
goto start

:desktop
cls
echo Generate desktop shortcut(by Direct launch)
echo Create C:\Samsung_Notes
for /f "tokens=2*" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Desktop') do set Desktop=%%b
md C:\Samsung_Notes
xcopy %cd%\galaxybook_mask\samsungnotes-directlaunch.bat C:\Samsung_Notes /y >nul
xcopy %cd%\notes.ico C:\Samsung_Notes /y >nul
set SrcFile=C:\Samsung_Notes\samsungnotes-directlaunch.bat
set lnkPath=%Desktop%\Samsung Notes.lnk
set lnkIcon=C:\Samsung_Notes\notes.ico
call :CreateShort "%SrcFile%" "%lnkPath%" "%lnkIcon%"
echo.
echo Press any key to continue
pause>nul
cls
goto start

:CreateShort
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(""%~2""):b.TargetPath=""%~1"":b.IconLocation=""%~3"":b.WorkingDirectory=""%~dp1"":b.Save:close")

pause
