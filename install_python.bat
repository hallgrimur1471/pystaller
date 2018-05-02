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
	echo "Installing for 32 bit computers has not yet been tested."
	echo "So don't be surprised If the following won't work :)"
	
	REM Install python2.7.15
	REM
	REM Documentation for argument options:
	REM     https://www.python.org/download/releases/2.4/msi/
	msiexec /i "!winthon!installers\32bit\python-2.7.15.msi" ^
	    /passive /norestart ^
		ADDLOCAL=ALL ^
		ALLUSERS=1 ^
		TARGETDIR="!winthon!bin\python2.7.15"
	
	REM Install python3.5.4
	REM
	REM Documentation for argument options:
	REM     https://docs.python.org/3.6/using/windows.html
	"!winthon!installers\32bit\python-3.5.4.exe" ^
		/passive /norestart ^
	    InstallAllUsers=1 ^
		CompileAll=1 ^
		PrependPath=1 ^
		TargetDir="!winthon!bin\python3.5.4"
	
	REM Install python3.6.5
	REM
	REM Documentation for argument options:
	REM     https://docs.python.org/3.6/using/windows.html
	"!winthon!installers\32bit\python-3.6.5.exe" ^
		/passive /norestart ^
	    InstallAllUsers=1 ^
		CompileAll=1 ^
		PrependPath=1 ^
		TargetDir="!winthon!bin\python3.6.5"
	
	exit /B 0
)
if "%bitarchitecture%"=="64bit" (
	REM Install python2.7.15
	REM
	REM Documentation for argument options:
	REM     https://www.python.org/download/releases/2.4/msi/
	msiexec /i "!winthon!installers\64bit\python-2.7.15.amd64.msi" ^
	    /passive /norestart ^
		ADDLOCAL=ALL ^
		ALLUSERS=1 ^
		TARGETDIR="!winthon!bin\python2.7.15"
	
	REM Install python3.5.4
	REM
	REM Documentation for argument options:
	REM     https://docs.python.org/3.6/using/windows.html
	"!winthon!installers\64bit\python-3.5.4-amd64.exe" ^
		/passive /norestart ^
	    InstallAllUsers=1 ^
		CompileAll=1 ^
		PrependPath=1 ^
		TargetDir="!winthon!bin\python3.5.4"
	
	REM Install python3.6.5
	REM
	REM Documentation for argument options:
	REM     https://docs.python.org/3.6/using/windows.html
	"!winthon!installers\64bit\python-3.6.5-amd64.exe" ^
		/passive /norestart ^
	    InstallAllUsers=1 ^
		CompileAll=1 ^
		PrependPath=1 ^
		TargetDir="!winthon!bin\python3.6.5"
	
	exit /B 0
)