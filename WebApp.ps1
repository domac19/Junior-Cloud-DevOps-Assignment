# Prebacivanje na direktorij 
cd $HOME/Documents

# Login na Azure
az login --use-device-code

# Prikaz accounta
az account show 

# Definiranje varijabli
$resourceGroupName = "junior-devops-rg"
$appServicePlanName = "junior-serviceplan1"
$newWebAppName = "newwebapp$((Get-Random).ToString('00000'))"

# Provjera prijave
$account = az account show --output json | ConvertFrom-Json
if (-not $account) {
    Write-Error "Azure login failed. Please ensure your credentials are correct."
    exit
}

# Izrada nove web aplikacije
az webapp create --resource-group $resourceGroupName --plan $appServicePlanName --name $newWebAppName

# Potvrda kreiranja 
Write-Output "Web App '$newWebAppName' created successfully in resource group '$resourceGroupName' with app