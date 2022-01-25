#####################################################################################################################################################
##                                                                                                                                                 ##
## This script creates Management Groups defined in the main.tf                                                   ##
##                                                                                                                                                 ##
#####################################################################################################################################################

terraform init

terraform plan -out main.tfplan

terraform apply "main.tfplan"

#terraform plan -destroy -var "billing_account_name=${BILLING_ACCOUNT_NAME}" -var "billing_profile_name=${BILLING_PROFILE_NAME}" -var "invoice_section_name=${INVOICE_SECTION_NAME}" -out main.destroy.tfplan

#terraform apply "main.destroy.tfplan"







