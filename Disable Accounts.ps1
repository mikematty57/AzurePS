Connect-AzureAD

$CSVFile = Import-Csv "UNC"

$data =

For ($x=0; $x -lt $CSVFile.Length ; $x++) {
    #Get-AzureADUser -Filter "userprincipalname eq 'name@onmicrosoft.com'"

    Get-AzureADUser -ObjectId $CSVFile[$x].UserPrincipalName
       

    }

  
    For ($x=0; $x -lt $data.Length ; $x++) {
    
    Set-AzureADUser -ObjectId $data[$x].ObjectId -AccountEnabled $False       

    }