
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Install-Module -Name AzureAD

install-module AzureADPreview

install-module MSOnline

Connect-AzureAD

Connect-MSOLService

Get-MsolAccountSku

import-module MSOnline


$users = import-csv "C:\M365\users.csv" -delimiter ","
foreach ($user in $users)
{
    $upn=$user.UserPrincipalName
    $usagelocation=$user.usagelocation 
    $SKU=$user.SKU
    Set-MsolUser -UserPrincipalName $upn -UsageLocation $usagelocation
    Set-MsolUserLicense -UserPrincipalName $upn -AddLicenses $SKU
    get-msoluserlicense -userprincipalname $upn > C:\license.log
} 

import-module MSOnline
$users = import-csv "C:\M365\users2.csv" -delimiter ","

foreach ($user in $users)
{
$upn=$user.UserPrincipalName
$SKU=$user.SKU
Set-MsolUserLicense -UserPrincipalName $upn -RemoveLicenses $SKU
}

