@echo off
rem Put this next to ps2EntryRunner.exe, SLPS_251.98 and the Final Mix ISO.
cd /d "%~dp0"
ps2EntryRunner.exe SLPS_251.98 > run_log.txt 2>&1
echo Game exited. Log saved to run_log.txt - send it to Claude if something went wrong.
pause
