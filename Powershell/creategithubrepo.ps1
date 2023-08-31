# Set your GitHub username and access token
$githubUsername = "kutagoolamalik"
$accessToken = "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"

# Set the repository details
$repoName = "NewRepository"
$repoDescription = "This is a new repository"
$repoPrivate = $false

# Set the GitHub API URL
$apiUrl = "https://api.github.com/user/repos"

# Create a JSON payload with the repository details
$payload = @{
    name = $repoName
    description = $repoDescription
    private = $repoPrivate
} | ConvertTo-Json

# Set the headers with the access token
$headers = @{
    "Authorization" = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Invoke the GitHub API to create the repository
#$response = invoke-restmethod -uri $apiurl -method post -headers $headers -body $payload

$response = invoke-restmethod -uri $apiurl -method post -headers $headers -body $payload


# Check the response status
if ($response.ssh_url) {
    Write-Host "Repository created successfully."
    Write-Host "SSH URL: $($response.ssh_url)"
} else {
    Write-Host "Failed to create repository. Error message: $($response.message)"
}


#===========================================================================================================================================




# Set the local file path and GitHub repository details
$localFilePath = "C:\Users\AL5423\Desktop\Test\A.txt"
$githubUsername = "Kutagoolamalik"
$repositoryName = "NewRepository"

# Set the Git commands
$gitInit = "git init"
$gitAdd = "git add ."
$gitCommit = "git commit -m 'Initial commit'"
$gitRemote = "git remote add origin https://github.com/$githubUsername/$repositoryName.git"
$gitPush = "git push -u origin master"

# Change to the directory containing the file
Set-Location (Split-Path $localFilePath)

# Execute the Git commands
Invoke-Expression $gitInit
Invoke-Expression $gitAdd
Invoke-Expression $gitCommit
Invoke-Expression $gitRemote
Invoke-Expression $gitPush

Write-Host "File pushed successfully to GitHub repository."


#=================================================================================================================================================



#$azureportal= connect-azaccount

#$list= get-azcontext

#$rg= new-azresourcegroup -name "ps1script" -location "westus2"

#$vmcreate= new-azvm -name "vmusingps" -resourcegroupname "ps1script" -location "westus2" -credential  (get-credential) 

#=====================================================================================================================================================


$azureportal= connect-azaccount

# Create variables to store the location and resource group names.
$location = "eastus"
$ResourceGroupName = "myResourceGroup12"

New-AzResourceGroup `
  -Name $ResourceGroupName `
  -Location $location

# Create variables to store the storage account name and the storage account SKU information
$StorageAccountName = "mystorageaccount"
$SkuName = "Standard_LRS"

# Create a new storage account
$StorageAccount = New-AzStorageAccount `
  -Location $location `
  -ResourceGroupName $ResourceGroupName `
  -Type $SkuName `
  -Name $StorageAccountName

Set-AzCurrentStorageAccount `
  -StorageAccountName $storageAccountName `
  -ResourceGroupName $resourceGroupName

# Create a subnet configuration
$subnetConfig = New-AzVirtualNetworkSubnetConfig `
  -Name mySubnet `
  -AddressPrefix 192.168.1.0/24

# Create a virtual network
$vnet = New-AzVirtualNetwork `
  -ResourceGroupName $ResourceGroupName `
  -Location $location `
  -Name MyVnet `
  -AddressPrefix 192.168.0.0/16 `
  -Subnet $subnetConfig

# Create a public IP address and specify a DNS name
$pip = New-AzPublicIpAddress `
  -ResourceGroupName $ResourceGroupName `
  -Location $location `
  -AllocationMethod Static `
  -IdleTimeoutInMinutes 4 `
  -Name "mypublicdns$(Get-Random)"

# Create an inbound network security group rule for port 3389
$nsgRuleRDP = New-AzNetworkSecurityRuleConfig `
  -Name myNetworkSecurityGroupRuleRDP `
  -Protocol Tcp `
  -Direction Inbound `
  -Priority 1000 `
  -SourceAddressPrefix * `
  -SourcePortRange * `
  -DestinationAddressPrefix * `
  -DestinationPortRange 3389 `
  -Access Allow

# Create an inbound network security group rule for port 80
$nsgRuleWeb = New-AzNetworkSecurityRuleConfig `
  -Name myNetworkSecurityGroupRuleWWW `
  -Protocol Tcp `
  -Direction Inbound `
  -Priority 1001 `
  -SourceAddressPrefix * `
  -SourcePortRange * `
  -DestinationAddressPrefix * `
  -DestinationPortRange 80 `
  -Access Allow

# Create a network security group
$nsg = New-AzNetworkSecurityGroup `
  -ResourceGroupName $ResourceGroupName `
  -Location $location `
  -Name myNetworkSecurityGroup `
  -SecurityRules $nsgRuleRDP,$nsgRuleWeb

# Create a virtual network card and associate it with public IP address and NSG
$nic = New-AzNetworkInterface `
  -Name myNic `
  -ResourceGroupName $ResourceGroupName `
  -Location $location `
  -SubnetId $vnet.Subnets[0].Id `
  -PublicIpAddressId $pip.Id `
  -NetworkSecurityGroupId $nsg.Id


# Define a credential object to store the username and password for the VM
$UserName='admin123'
$Password='Azure@123456'| ConvertTo-SecureString -Force -AsPlainText
$Credential=New-Object PSCredential($UserName,$Password)

# Create the VM configuration object
$VmName = "VirtualMachinelatest"
$VmSize = "Standard_A1"
$VirtualMachine = New-AzVMConfig `
  -VMName $VmName `
  -VMSize $VmSize

$VirtualMachine = Set-AzVMOperatingSystem `
  -VM $VirtualMachine `
  -Windows `
  -ComputerName "MainComputer" `
  -Credential $Credential -ProvisionVMAgent

$VirtualMachine = Set-AzVMSourceImage `
  -VM $VirtualMachine `
  -PublisherName "MicrosoftWindowsServer" `
  -Offer "WindowsServer" `
  -Skus "2016-Datacenter" `
  -Version "latest"

# Sets the operating system disk properties on a VM.
$VirtualMachine = Set-AzVMOSDisk `
  -VM $VirtualMachine `
  -CreateOption FromImage | `
  Set-AzVMBootDiagnostic -ResourceGroupName $ResourceGroupName `
  -StorageAccountName $StorageAccountName -Enable |`
  Add-AzVMNetworkInterface -Id $nic.Id


# Create the VM.
New-AzVM `
  -ResourceGroupName $ResourceGroupName `
  -Location $location `
  -VM $VirtualMachine


  #======================================================================================================================================================




