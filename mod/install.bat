@ECHO OFF
ECHO WELCOME TO THE NCAA NEXT MOD SET-UP HELPER.
ECHO Version: NCAA NEXT 25!
ECHO '
ECHO '
:start
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
ECHO '
ECHO '
echo Set-Up Complete. Proceed to IMG BURN.
PAUSE
echo Continuing Set-Up. Clearing install files...
