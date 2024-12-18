@echo off
REM Set source and destination directories
set "source=%~dp0"
set "destination=C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid"
set "rar_file=%source%\media\videos\pztitletest.part1.rar"  REM Correct the path by removing extra backslash
set "rar_path=C:\Program Files\WinRAR\unrar.exe"  REM Set this to the location of unrar.exe on your system

REM Ensure the destination directory exists
if not exist "%destination%" (
    echo Destination directory does not exist. Exiting...
    pause
    exit /b
)

REM Check if unrar.exe exists
if not exist "%rar_path%" (
    echo unrar.exe not found. Please make sure WinRAR is installed.
    pause
    exit /b
)

REM Unrar the .rar file to the destination directory
"%rar_path%" x "%rar_file%" "%destination%\media\videos\"

REM Ensure the files were unrarred successfully
if exist "%destination%\pztitletest.bk2" (
    echo pztitletest.bk2 successfully extracted!
) else (
    echo Failed to extract pztitletest.bk2.
    pause
    exit /b
)

REM Copy files from source to destination
xcopy "%source%\*" "%destination%" /E /I /Y

REM Inform the user the copy is complete
echo Files have been copied successfully!
pause
