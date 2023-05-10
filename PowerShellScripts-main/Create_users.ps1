

Install-Module MSOnline


Connect-MsolService


$Users = Import-Csv -Path "C:\m365\usuarios.csv"

foreach ($User in $Users) {
    New-MsolUser -UserPrincipalName $User.UserPrincipalName -DisplayName $User.DisplayName -FirstName $User.FirstName -LastName $User.LastName -Password $User.Password
}