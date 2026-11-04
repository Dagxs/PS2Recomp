@echo off
rem Builds the Kingdom Hearts Final Mix PC runner (ps2EntryRunner.exe).
rem Needs: Visual Studio 2022 with "Desktop development with C++" (includes CMake).
rem Run this from "x64 Native Tools Command Prompt for VS 2022", or just double-click it.

cd /d "%~dp0"

where cmake >nul 2>nul
if errorlevel 1 (
    for /f "usebackq tokens=*" %%i in (`"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -latest -property installationPath`) do set VSPATH=%%i
    if exist "%VSPATH%\VC\Auxiliary\Build\vcvars64.bat" call "%VSPATH%\VC\Auxiliary\Build\vcvars64.bat"
)

cmake -S . -B out\build -G "Visual Studio 17 2022" -A x64 -DPS2X_BUILD_RECOMP=OFF -DPS2X_BUILD_ANALYZER=OFF -DPS2X_BUILD_TEST=OFF -DPS2X_BUILD_STUDIO=OFF
if errorlevel 1 goto fail

cmake --build out\build --config Release --target ps2EntryRunner -- /m
if errorlevel 1 goto fail

echo.
echo Build finished. The exe is in out\build\ps2xRuntime\Release\
echo Copy ps2EntryRunner.exe (and any .dll next to it) into the folder with
echo SLPS_251.98 and the ISO, then run RUN_KH_FM.bat.
pause
exit /b 0

:fail
echo.
echo Build FAILED - copy the error text above and send it to Claude.
pause
exit /b 1
