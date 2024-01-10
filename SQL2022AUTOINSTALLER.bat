REM SQL Runtime Auto Installer
echo off
ECHO Installing SQL 2022 Runtime, Instance name DBINSTANCENAMEGOESHERE
"C:\Path\To\Installer\SQL Runtime 2022 (64bit)\setup.exe" /ConfigurationFile="c:\path\to\installer\SQL Runtime 2022 (64bit)\configurationFile.ini"
ECHO Click Install when prompted
cd\
cd "c:Path\ToInstaller\SQL Runtime 2022 (64bit)"
SSMS-Setup-ENU.exe
:ASK
ECHO
sc config SQLAgent$DBINSTANCENAMEGOESHERE start= disabled
sc config MSSQL$DBINSTANCENAMEGOESHERE start= disabled
ECHO This installer has completed
pause
exit