@ECHO OFF
ECHO Welcome to the NCAA 06 NEXT ISO MOD CREATION TOOL
ECHO '
ECHO '
ECHO '
pause

:start
ECHO Checking if installation files are in the correct folder...
IF EXIST MOD\SLUS_212.14 GOTO :check2
ECHO The Installation Files are not in the correct folders. Please re-read the instructions and try again!
PAUSE
EXIT

:check2
IF EXIST *.ISO GOTO :check3
ECHO The Installation Files are not in the correct folders. Please re-read the instructions and try again!
PAUSE
EXIT

:check3
IF EXIST IMGBURN.EXE GOTO :install
ECHO The Installation Files are not in the correct folders. Please re-read the instructions and try again!
PAUSE
EXIT


:install
ECHO Preparing and Extracting Original NCAA 06 Files and Patching NCAA 06 NEXT Files...
ECHO Please wait a moment...
ECHO '
ECHO '
pause
rename *.iso NCAA06.iso
mkdir next
powershell -ExecutionPolicy Bypass -File powershell.ps1

cd next

ECHO Checking if installation files are in the correct folder...
IF EXIST SYSTEM.CNF GOTO :clean
ECHO The Installation Files are not in the correct ISO folder. Please re-read the instructions and try again!
PAUSE
EXIT

:clean
ECHO '
ECHO '
ECHO Installation File Location: Correct.
echo Continuing Set-Up. Deleting QKL files...
del DATA\*.qkl
echo Deleting DEMO files...
rmdir /S /Q MMNCDEMO
echo Deleting ONLINE files...
rmdir /S /Q NETGUI
rmdir /S /Q EACN
rmdir /S /Q ONLINE
del DATA\CAFE*.DAT
del DATA\ONLINE.DAT
del DATA\ONTROPHY.DAT
del DATA\OSDKSTRN.DAT
del DATA\UIONLINE.DAT
echo Deleting Race for the Heisman
del DATA\UIS_DORM.DAT
PAUSE

ECHO Patching Complete!
ECHO '
ECHO '
ECHO '
ECHO Running IMGBURN to create NCAA NEXT ISO!
ECHO This may take a few moments to load and run. If prompted by IMGBURN, press YES each time!
cd ..
ImgBurn /mode build /src "next" /dest "NCAA NEXT 25.iso" /volumelabel "NCAA NEXT" /start /overwrite yes /overwrite yes /close
ECHO NCAA 06 NEXT ISO Game successfully created!
pause



