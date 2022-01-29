#####################################################################################################################################################
##                                                                                                                                                 ##
## This script creates subscriptions defined in the main.tf                                                   ##
##                                                                                                                                                 ##
#####################################################################################################################################################

############### Input Variables ########################

$subInfoPath = 'D:\Temp\sub-vars.clixml'

########################################################

[hashtable]$SubPreReq = Import-CliXml -path $subInfoPath

$BILLING_ACCOUNT_NAME = $SubPreReq.BILLING_ACCOUNT_NAME

$BILLING_PROFILE_NAME = $SubPreReq.BILLING_PROFILE_NAME

$INVOICE_SECTION_NAME = $SubPreReq.INVOICE_SECTION_NAME



terraform init

terraform plan -var "billing_account_name=${BILLING_ACCOUNT_NAME}" -var "billing_profile_name=${BILLING_PROFILE_NAME}" -var "invoice_section_name=${INVOICE_SECTION_NAME}" -out main.tfplan

terraform apply "main.tfplan"







