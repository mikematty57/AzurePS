Import-Module MSOnline

$credential = get-credential

Connect-MsolService -Credential $credential


$CCU = "GUID"
$CCS = "GUID"
$UA = "GUID"

$CSVFile = Import-Csv "UNC"
For ($x=0; $x -lt $CSVFile.Length ; $x++) {
  
    $UserPrincipalName = $CSVFile[$x].UserPrincipalName
    $user = Get-MsolUser -UserPrincipalName $UserPrincipalName
    $objectId = $user.ObjectId;
 
    Remove-MsolGroupMember -GroupObjectId $CCU -GroupMemberObjectID $objectId -GroupMemberType User
    Add-MsolGroupMember -GroupMemberObjectId $objectId -GroupObjectId $CCS -GroupMemberType User

}