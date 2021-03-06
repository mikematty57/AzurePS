Import-Module MSOnline

$credential = get-credential

Connect-MsolService -Credential $credential

$CSVFile = Import-Csv "UNC"
For ($x=0; $x -lt $CSVFile.Length ; $x++) {
    
    New-MsolUser -UserPrincipalName $CSVFile[$x].UserPrincipalName -FirstName $CSVFile[$x].FirstName -LastName $CSVFile[$x].LastName -DisplayName $CSVFile[$x].DisplayName -Title $CSVFile[$x].Title -Department $CSVFile[$x].Department -Office $CSVFile[$x].Office -Country $CSVFile[$x].Country -Password $CSVFile[$x].Password -ForceChangePassword $false
    Set-MsolUser -UserPrincipalName $CSVFile[$x].UserPrincipalName -PasswordNeverExpires $true
    $UserPrincipalName = $CSVFile[$x].UserPrincipalName
    $user = Get-MsolUser -UserPrincipalName $UserPrincipalName
    $objectId = $user.ObjectId;
    Add-MsolGroupMember -GroupMemberObjectId $objectId -GroupObjectId !GUID! -GroupMemberType User

    }