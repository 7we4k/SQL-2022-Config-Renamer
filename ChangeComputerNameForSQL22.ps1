##Change Computer Name in SQL Auto Installer by 7we4k 1/10/24

# Get the computer name
$computerName = $env:COMPUTERNAME

# Check if the computer name is allowed for installation
$allowedComputerNames = @('ComputerName1', 'ComputerName2', 'ComputerName3', 'ComputerName4', 'ComputerName5', 'ComputerName6', 'ComputerName7', 'ComputerName8', 'ComputerName9')
if ($allowedComputerNames -contains $computerName) {
    # Set the SQLSYSADMINACCOUNTS parameter
    $sqlSysAdminAccounts = "$computerName\Administrator", "BUILTIN\Administrators"

    # Update the ConfigurationFile.ini
    $configFilePath = "C:\Path\To\SQL Runtime 2022 (64bit)\ConfigurationFile.ini"
    $configContent = Get-Content -Path $configFilePath -Raw
    $configContent = $configContent -replace '(?s)SQLSYSADMINACCOUNTS=".*?"', "SQLSYSADMINACCOUNTS=`"$($sqlSysAdminAccounts -join '" "')`""
    Set-Content -Path $configFilePath -Value $configContent

    # Exit with success code
    exit 0
} else {
    # Exit with error code
    exit 1
}
