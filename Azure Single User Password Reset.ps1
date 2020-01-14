Import-Module MSOnline

$credential = get-credential

Connect-MsolService -Credential $credential

Set-MsolUserPassword -UserPrincipalName #UPn# -NewPassword #NP#
