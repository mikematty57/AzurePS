Connect-AzureAD
Get-AzureADUser

Get-AzureADUser -all $true | Select-Object Displayname,Jobtitle,Userprincipalname | Export-csv "UNC"