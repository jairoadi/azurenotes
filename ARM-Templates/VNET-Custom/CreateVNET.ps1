# Resource Group

$resourceGroup = "SL-Network"
$location = "West US 2"

#Vnet Name and Address Space
$VNETName = "SL-Az300-PShell"
$VNETAddressSpace = "10.1.0.0/22"

#Subnet Names and Address Space
$subnetAName = "SL-Web"
$subnetAAddressPrefix = "10.1.0.0/24"
$subnetBName = "SL-App"
$subnetBAddressPrefix = "10.1.1.0/24"
$subnetCName = "SL-Data"
$subnetCAddressPrefix = "10.1.2.0/24"


#Create Subnet
$subnets = New-AzureRmVirtualNetworkSubnetConfig -Name $subnetAName -AddressPrefix $subnetAAddressPrefix


#Create VNET and include subnet configuration
$vnet = New-AzureRmVirtualNetwork -Name $VNETName -ResourceGroupName $resourceGroup -Location $location -AddressPrefix $VNETAddressSpace -Subnet $subnets

#Include additional Subnets
Add-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $subnetCName -AddressPrefix $subnetCAddressPrefix
Add-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $subnetBName -AddressPrefix $subnetBAddressPrefix


#Save
Set-AzureRmVirtualNetwork -VirtualNetwork $vnet