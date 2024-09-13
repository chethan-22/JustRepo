# Pre-Requsite-1 : Install-Module -Name Az -AllowClobber -Scope AllUsers
# Pre-Requsite-2 : Connect-AzAccount and Set-Context -Subscription "YoursSubscription"

## Create new RG
New-AzResourceGroup `
  -Name templatespecsRG `
  -Location westus2

## Create New TemplateSpec Resource
New-AzTemplateSpec `
  -Name chethan`
  -Version `
  -ResourceGroupName `
  -Location `
  -TemplateFile "C:\Desktop\POC\BP-TSDS\TemplateSpec\azuredeploy.json"

## Create new RG
New-AzResourceGroup `
  -Name templatespecsRG123 `
  -Location westus2

## Get TemplateSpec ID
$id = (Get-AzTemplateSpec -ResourceGroupName templatespecsRG -Name chethan -Version "1.0").Version.Id

## Deploy Template Spec
New-AzResourceGroupDeployment `
  -TemplateSpecId $id `
  -ResourceGroupName templatespecsRG123


