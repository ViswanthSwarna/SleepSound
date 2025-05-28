@echo off

:: Delay until 11:00 PM
:waitForTime
for /f %%t in ('time /t') do set currTime=%%t
if "%currTime%"=="11:00 PM" goto play
timeout /t 60 >nul
goto waitForTime

:play
:: Start playing audio file with VLC (adjust the path)
start "" "C:\Program Files\VideoLAN\VLC\vlc.exe" "C:\Users\sai\Documents\sleep\ocean-beach-waves.mp3"

:: Wait for 90 minutes (from 11:00 PM to 12:30 AM = 5400 seconds)
timeout /t 5400 /nobreak

:: Kill VLC player
taskkill /IM vlc.exe /F

:: Put the computer to sleep
rundll32.exe powrprof.dll,SetSuspendState 0,1,0
