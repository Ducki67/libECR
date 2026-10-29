@echo off
REM Build ErbiumCrashReporter with Visual Studio (msbuild).
setlocal

set CONFIG=%~1
if "%CONFIG%"=="" set CONFIG=Release

set PLATFORM=%~2
if "%PLATFORM%"=="" set PLATFORM=x64

set MSBUILD=
for /f "usebackq tokens=*" %%i in (`"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -latest -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe`) do set MSBUILD=%%i
if "%MSBUILD%"=="" set MSBUILD=msbuild

"%MSBUILD%" "ErbiumCrashReporter.slnx" /p:Configuration=%CONFIG% /p:Platform=%PLATFORM%
if errorlevel 1 exit /b 1

echo Build complete: %CONFIG% %PLATFORM%
endlocal
pause
