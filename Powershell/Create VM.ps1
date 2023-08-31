# Connect to your Azure account
Connect-AzAccount

# Create a new resource group 
New-AzResourceGroup -Name 'todelete' -Location 'EastUS'

# Create a new virtual machine 
New-AzVm `
    -ResourceGroupName 'todelete' `
    -Name 'myVM' `
    -Location 'EastUS' `
    -VirtualNetworkName 'myVnet' `
    -SubnetName 'mySubnet' `
    -SecurityGroupName 'myNetworkSecurityGroup' `
    -PublicIpAddressName 'myPublicIpAddress' `
    -OpenPorts 80,3389 `
    -Size 'Standard_DS1_v2'
