@echo off
REM Set source and destination directories
set "source=%~dp0"
set "destination=C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid"
set "illustrations=%destination%\media\ui\Illustrations"
set "video1=%destination%\media\videos\pztitletest.bk2"

REM Ensure the destination directory exists
if not exist "%destination%" (
    echo Destination directory does not exist. Exiting...
    pause
    exit /b
)

REM Delete all files in Illustrations folder
if exist "%illustrations%" (
    echo Deleting files in "%illustrations%"...
    del /q "%illustrations%\*"
) else (
    echo Illustrations folder does not exist.
)

REM Delete specific video files
if exist "%video1%" (
    echo Deleting "%video1%"...
    del /q "%video1%"
) else (
    echo "%video1%" does not exist.
)

REM Copy files from source to destination
echo Copying files from "%source%" to "%destination%"...
xcopy "%source%\*" "%destination%" /E /I /Y

REM Inform the user the operations are complete
echo Operations completed successfully!
pause
