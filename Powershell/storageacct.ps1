# Set your variables
$resourceGroupName = "sample-RG"
$storageAccountName = "storageaccount6343"
$sourceContainerName = "containerdev"  # Source container name
$destinationContainerName = "containersqlite"  # Destination container name
$sourceBlobPath = "sqllite/sub folder/file1"  # Source blob path (text file)
$destinationBlobName = "file1_copy.txt"  # Destination blob name

# Login to Azure (if not already logged in)
Connect-AzAccount

# Get storage account key for source storage account
$sourceStorageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -AccountName $storageAccountName)[0].Value

# Get storage account key for destination storage account
$destinationStorageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -AccountName $storageAccountName)[0].Value

# Create a new blob context for source container
$sourceContext = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $sourceStorageAccountKey

# Create a new blob context for destination container
$destinationContext = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $destinationStorageAccountKey

# Start copying the blob from source container to destination container
Start-AzStorageBlobCopy -Context $sourceContext -SrcContainer $sourceContainerName -SrcBlob $sourceBlobPath -DestContext $destinationContext -DestContainer $destinationContainerName -DestBlob $destinationBlobName

Write-Host "Blob copied successfully from '$sourceContainerName' to '$destinationContainerName'."
