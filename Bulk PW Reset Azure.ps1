Import-Module MSOnline

$credential = get-credential

Connect-MsolService -Credential $credential


$CSVFile = Import-Csv #UNC#
For ($x=0; $x -lt $CSVFile.Length ; $x++) {

Set-MsolUserPassword -UserPrincipalName $CSVFile[$x].UserPrincipalName -NewPassword #Password#

}