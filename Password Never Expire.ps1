Import-Module MSOnline

$credential = get-credential

Connect-MsolService -Credential $credential

$getname = read-host "Enter the user name to make password never expire:"

Set-MsolUser -UserPrincipalName $getname -PasswordNeverExpires $true 