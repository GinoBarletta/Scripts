#
# Outlook Diagnostics - 1
#

# Get Outlook version
$outlook = New-Object -ComObject Outlook.Application
$outlookVersion = $outlook.Version

# Get Outlook accounts
$accounts = $outlook.Session.Accounts | Select-Object DisplayName, UserName

# Get Outlook add-ins
$addins = Get-ChildItem 'HKCU:\Software\Microsoft\Office\Outlook\Addins'

# Display collected information
Write-Output "Outlook Version: $outlookVersion"
Write-Output "Outlook Accounts:"
$accounts | Format-Table -AutoSize
Write-Output "Outlook Add-ins:"
$addins | ForEach-Object { $_.Name }

