# Connect to Azure account
Connect-AzAccount

# Get all resource groups
$resourceGroups = Get-AzResourceGroup

# Delete each resource group
foreach ($resourceGroup in $resourceGroups) {
    $resourceGroupName = $resourceGroup.ResourceGroupName
    Write-Host "Deleting resource group: $resourceGroupName"
    Remove-AzResourceGroup -Name $resourceGroupName -Force
}

Write-Host "All resource groups deleted."