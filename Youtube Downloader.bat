@echo off
title YouTube Downloader (Video / MP3)

:start
echo ===============================================
echo       YouTube Downloader (BATCH by ROGER)
echo ===============================================
echo.

:: Ask for the save folder
set /p destination="Enter the folder path where the downloaded files will be saved (example: D:\YouTubeDownloads): "

:: Create the folder if it doesn't exist
if not exist "%destination%" (
    echo Folder not found, creating...
    mkdir "%destination%"
    echo Folder created: %destination%
)
echo.

:menu
cls
echo ===============================================
echo             DOWNLOAD TYPE SELECTION
echo ===============================================
echo [1] Download Video (MP4)
echo [2] Download Audio (MP3)
echo.
set "choice="
set /p choice="Make your choice (1 or 2):"

if "%choice%"=="1" (
    goto video
)
if "%choice%"=="2" (
    goto audio
)

echo Invalid selection! You must enter 1 or 2.
timeout /t 2 >nul
cls
goto menu

:video
cls
echo ===============================================
echo               VIDEO DOWNLOAD MODE
echo ===============================================
echo.
set /p link="Enter the YouTube video, playlist, or channel link: "
echo.
echo --- Video is downloading---
yt-dlp.exe -f bestvideo+bestaudio --merge-output-format mp4 -o "%destination%\%%(playlist_index)s - %%(title)s.%%(ext)s" "%link%"
echo.
echo --- The video has been downloaded! ---
goto next

:audio
cls
echo ===============================================
echo               AUDIO DOWNLOAD MODE
echo ===============================================
echo.
set /p link="Enter the YouTube video, playlist, or channel link: "
echo.
echo --- Audio is downloading ---
yt-dlp.exe -x --audio-format mp3 --embed-thumbnail --add-metadata -o "%destination%\%%(title)s.%%(ext)s" "%link%"
echo.
echo --- Audio downloaded! ---
goto next

:next
echo.
echo =======================================================================
echo        The process is complete. What would you like to do now?
echo =======================================================================
echo [1] Return to the main menu (video/audio selection)
echo [2] Close the program
echo.
set "continue="
set /p continue="Your choice (1 or 2): "

if "%continue%"=="1" goto start
if "%continue%"=="2" exit

echo.
echo Invalid selection! You must enter 1 or 2.
timeout /t 2 >nul
cls
goto next