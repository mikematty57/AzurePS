#$msolcred = Get-Credential
#Connect-MsolService -Credential $msolcred
#$user = Get-MsolUser -UserPrincipalName #UPN#
#$objectId = $user.ObjectId;
##($user).ObjectId #| 
#Add-MsolGroupMember -GroupMemberObjectId $objectId -GroupObjectId #GUID# -GroupMemberType User

Import-Module MSOnline

$credential = get-credential

Connect-MsolService -Credential $credential

#Import-Csv "\\vhq-sx-pr-ldsk1\Packages2\Platform Carrier ID create\platformuser1.csv" | ForEach-Object { New-MsolUser -UserPrincipalName $_.UserPrincipalName -FirstName $_.FirstName -LastName $_.LastName -DisplayName $_.DisplayName -Title $_.Title -Department $_.Department -Office $_.Office -Country $_.Country -Password $_.Password -ForceChangePassword $false}

#Import-Csv "\\vhq-sx-pr-ldsk1\Packages2\Platform Carrier ID create\platformuser1.csv" | ForEach-Object { Set-MsolUser -UserPrincipalName $_.UserPrincipalName -PasswordNeverExpires $true }


#THIS WILL SET AND PROVIDE PASSWORD THAT DOES NOT EXPIRE SO YOU DO NOT NEED TO DO IT IN THE PORTAL

#Set-MsolUserPassword -UserPrincipalName $_.UserPrincipalName -ForceChangePassword $false -NewPassword Wildred94!

#Add Group Membershipt to EnterprisePlatform.Tenant.TXLIDA.CarrierPortal


$CSVFile = Import-Csv #CSVUNC#
For ($x=0; $x -lt $CSVFile.Length ; $x++) {
  
    $UserPrincipalName = $CSVFile[$x].UserPrincipalName
    $user = Get-MsolUser -UserPrincipalName $UserPrincipalName
    $objectId = $user.ObjectId;
    #Add-MsolGroupMember -GroupMemberObjectId $objectId -GroupObjectId #GUID# -GroupMemberType User
}
