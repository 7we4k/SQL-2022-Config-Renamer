The SQL 2022 Configuration Renamer is a script that I created to rename the Server Name in the ConfigurationFile.ini for an SQL 2022 installation.

I found that previous iterations of SQL would use SQLSYSADMINACCOUNTS="%COMPUTERNAME%\Administrator" "BUILTIN\Administrators" to add users to the SQLSYSADMINACCOUNTS
when installing.  SQL 2022 requires the Computer Name to install, so when you have to install SQL on multiple different named Servers, with an unattended script, you could only manually edit the name on a different system in the ConfigurationFile.ini
to get it to install.

With this script, you run the ChangeComputerNameForSQL22.ps1, where it will take your computer name, and insert it into the ConfigurationFile.ini.  You then can run your Batch File for an unattended installation of SQL 2022.

A couple notes:
- In the ChangeComputerNameforSQL22.ps1 file, you will need to specify the computer names that you would like to work with this script.
`` $allowedComputerNames = @('ComputerName1', 'ComputerName2', 'ComputerName3', 'ComputerName4', 'ComputerName5', 'ComputerName6', 'ComputerName7', 'ComputerName8', 'ComputerName9') ``
Replace `ComputerName1` and so on with your own computer names that you frequently install SQL to.

- In the ConfigurationFile.ini, you will need to replace DBINSTANCENAMEGOESHERE with your Database's Instance Name, change any paths that may be different in your environment, and add / remove any features that you need or don't need in SQL.
-   Leave "%COMPUTERNAME%\Administrator" behind the SQLSYSADMINACCOUNTS entry.  When the script runs, it replaces it with your new Computer Name, and adds the Builtin\Administrators also.

-   In the SQL2022AUTOINSTALLER.bat, you will need to update DBINSTANCENAMEGOESHERE with your Database's Instance Name, and change any paths that may be different in your environment.

  And there you have it!  If you need to install SQL 2022 to multiple named Servers, using the same ConfigurationFile.ini, this is the tool for you!
