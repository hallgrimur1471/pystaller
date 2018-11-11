:: Turn off echoing of commands
@echo off
REM Set environment variable changes to be local for this script
REM Also, support "correct" variable expansion in "if" statements.
setlocal enableDelayedExpansion

REM Figure out whether this computer is 64 or 32 bit
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" ^
    | find /i "x86" > NUL && ^
	set bitarchitecture=32bit || set bitarchitecture=64bit

REM This scripts directory
set winthon=%~dp0%

if "%bitarchitecture%"=="32bit" (
	echo "Uninstalling for 32 bit computers has not yet been tested."
	echo "So don't be surprised If the following won't work :)"
	
	REM Uninstall python2.7.15
	REM
	REM Documentation for argument options:
	REM     https://www.python.org/download/releases/2.4/msi/
	msiexec /x "!winthon!installers\32bit\python-2.7.15.msi" ^
		/passive /norestart ^
		ADDLOCAL=ALL ^
		ALLUSERS=1 ^
		TARGETDIR="!winthon!bin\python2.7.15" | REM
	
	REM Uninstall python3.7.1
	REM
	REM Documentation for argument options:
	REM     https://docs.python.org/3.7/using/windows.html
	"!winthon!installers\32bit\python-3.7.1.exe" ^
		/uninstall /norestart ^
		UninstallAllUsers=1 ^
		CompileAll=1 ^
		PrependPath=1 ^
		TargetDir="!winthon!bin\python3.7.1" | REM
)
if "%bitarchitecture%"=="64bit" (
	REM Uninstall python2.7.15
	REM
	REM Documentation for argument options:
	REM     https://www.python.org/download/releases/2.4/msi/
	msiexec /x "!winthon!installers\64bit\python-2.7.15.amd64.msi" ^
		/passive /norestart ^
		ADDLOCAL=ALL ^
		ALLUSERS=1 ^
		TARGETDIR="!winthon!bin\python2.7.15" | REM
	
	REM Uninstall python3.7.1
	REM
	REM Documentation for argument options:
	REM     https://docs.python.org/3.7/using/windows.html
	"!winthon!installers\64bit\python-3.7.1-amd64.exe" ^
		/uninstall /passive /norestart ^
		UninstallAllUsers=1 ^
		CompileAll=1 ^
		PrependPath=1 ^
		TargetDir="!winthon!bin\python3.7.1" | REM
)

powershell -Command ^
	Remove-Item ^
	    -Path "!winthon!bin\python2.7.15" -recurse
powershell -Command ^
	Remove-Item ^
	    -Path "!winthon!bin\python3.7.1" -recurse
	
exit /B 0