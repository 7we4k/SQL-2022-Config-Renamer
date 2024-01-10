REM SQL Runtime Auto Installer
echo off
ECHO Installing SQL 2022 Runtime, Instance name DBINSTANCENAMEGOESHERE
"C:\Path\To\Installer\SQL Runtime 2022 (64bit)\setup.exe" /ConfigurationFile="c:\path\to\installer\SQL Runtime 2022 (64bit)\configurationFile.ini"
ECHO Click Install when prompted
cd\
cd "c:Path\ToInstaller\SQL Runtime 2022 (64bit)"
SSMS-Setup-ENU.exe
REM This shuts off the SQL server service on workstations
Set Server=A
:ASK
ECHO
ECHO Is This A Server (Y/N)? :
set /p Server= %=%
If %Server% == y Goto YES
If %Server% == Y Goto YES
If %Server% == n Goto NO
If %Server% == N Goto NO
ECHO Not A Valid Entry
Goto ASK
:NO
sc config SQLAgent$DBINSTANCENAMEGOESHERE start= disabled
sc config MSSQL$DBINSTANCENAMEGOESHERE start= disabled
:YES
ECHO This installer has completed
pause
exit