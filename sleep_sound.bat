
@echo off
setlocal

:: Target time: 23:00 (11:00 PM) in 24-hour format
set targetHour=23
set targetMinute=00

:waitForTime
for /f "tokens=1-2 delims=:" %%a in ("%time%") do (
    set /a currHour=1%%a-100
    set /a currMinute=1%%b-100
)

if %currHour% GTR %targetHour% goto play
if %currHour% EQU %targetHour% if %currMinute% GEQ %targetMinute% goto play

timeout /t 30 >nul
goto waitForTime

:play
:: Start VLC audio playback (adjust path as needed)
start "" "C:\Program Files\VideoLAN\VLC\vlc.exe" "C:\Users\sai\Documents\sleep\ocean-beach-waves.mp3" --loop

nircmd monitor off

:: Wait 90 minutes (from 11:00 PM to 12:30 AM)
timeout /t 5400 /nobreak

:: Kill VLC player
taskkill /IM vlc.exe /F

:: Put the PC to sleep
rundll32.exe powrprof.dll,SetSuspendState 0,1,0
