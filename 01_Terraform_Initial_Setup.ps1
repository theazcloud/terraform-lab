#####################################################################################################################################################
##                                                                                                                                                 ##
## This script creates the initial Terraform connection to the chosen Azure Tenant                                                                 ##
##                                                                                                                                                 ##
#####################################################################################################################################################

######################## Input Variabbles ###############################

$cliXMLPath = 'D:\Temp\env-vars.clixml'

$subInfoPath = 'D:\Temp\sub-vars.clixml'

$GithubPath = 'D:\Github'

##########################################################################

Import-CliXml -path $cliXMLPath | ForEach-Object { Set-Item "env:$($_.Name)" $_.Value }

Remove-Item -path $cliXMLPath -Force


[hashtable]$SubPreReq = Import-CliXml -path $subInfoPath

$BILLING_ACCOUNT_NAME = $SubPreReq.BILLING_ACCOUNT_NAME

$BILLING_PROFILE_NAME = $SubPreReq.BILLING_PROFILE_NAME

$INVOICE_SECTION_NAME = $SubPreReq.INVOICE_SECTION_NAME

Remove-Item -path $subInfoPath -Force

Set-Location -path $GithubPath\terraform-lab\es-lz

az login --tenant $env:ARM_TENANT_ID

terraform init

terraform plan -var "billing_account_name=${BILLING_ACCOUNT_NAME}" -var "billing_profile_name=${BILLING_PROFILE_NAME}" -var "invoice_section_name=${INVOICE_SECTION_NAME}" -out main.tfplan

terraform apply "main.tfplan"

terraform plan -var "billing_account_name=${BILLING_ACCOUNT_NAME}" -var "billing_profile_name=${BILLING_PROFILE_NAME}" -var "invoice_section_name=${INVOICE_SECTION_NAME}" -destroy -out destroy.main.tfplan

terraform apply "destroy.main.tfplan"
