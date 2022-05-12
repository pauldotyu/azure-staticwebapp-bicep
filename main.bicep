param appName string
param location string = resourceGroup().location
param sku string
param skuCode string
param repositoryUrl string
param branch string
param appLocation string
param apiLocation string
param appArtifactLocation string
param repositoryToken string

resource staticWebApp 'Microsoft.Web/staticSites@2021-03-01' = {
  name: appName
  location: location
  properties: {
    repositoryUrl: repositoryUrl
    branch: branch
    repositoryToken: repositoryToken
    buildProperties: {
      appLocation: appLocation
      apiLocation: apiLocation
      appArtifactLocation: appArtifactLocation
    }
  }
  sku: {
    tier: sku
    name: skuCode
  }
}
