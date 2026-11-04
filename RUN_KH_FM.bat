@echo off
rem Put this next to ps2EntryRunner.exe, SLPS_251.98, the Final Mix ISO,
rem and the files extracted from the ISO (7-Zip > Extract Here).
rem Output stays in the console window on purpose: the log can grow by
rem gigabytes per minute, so it is not saved to a file.
cd /d "%~dp0"
ps2EntryRunner.exe SLPS_251.98
echo.
echo Game exited. If it crashed, screenshot the last lines above and send them to Claude.
pause
