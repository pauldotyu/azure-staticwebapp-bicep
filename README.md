# azure-staticwebapp-bicep

To run this:

```bash
# install the petname utility to generate a fun name
sudo apt-get install petname
project=$(petname -s '' --ubuntu)

# log into azure
az login

# set the location for your static web app, but if you are unsure of where this service can be deployed to, run this:
sub=$(az account show --query id -o tsv)
az rest --method get --uri https://management.azure.com/subscriptions/$sub/providers/Microsoft.Web/resourceTypes?api-version=2021-04-01 --query "value[?resourceType == 'staticSites'].locations[]"

location=westus2

# create the resource group
rg=$(az group create -n project -l $location --query name)

# set up parameters
appName=$project
sku="Free"
skuCode="Free"
repositoryUrl="<YOUR_REPO_URL>"
branch="<YOUR_REPO_BRANCH>"
appLocation="<YOUR_APP_LOCATION>"
apiLocation="<YOUR_API_LOCATION>"
appArtifactLocation="<YOUR_ARTIFACT_LOCATION>"
repositoryToken="<YOUR_REPO_TOKEN>"

# deploy
az deployment group create \
  --name $project-deployment \
  --resource-group $rg \
  --template-file .\main.bicep \
  --parameters appName=$appName sku=$sku skuCode=$skuCode repositoryUrl=$repositoryUrl branch=$branch appLocation=$appLocation apiLocation=$apiLocation  appArtifactLocation=$appArtifactLocation repositoryToken=$repositoryToken
```
