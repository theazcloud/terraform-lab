#####################################################################################################################################################
##                                                                                                                                                 ##
## This script creates subscriptions defined in the main.tf                                                   ##
##                                                                                                                                                 ##
#####################################################################################################################################################


$billing  = Get-AzBillingAccount

$billingprofile = Get-AzBillingProfile -BillingAccountName $billing.Name

$billinginvoicesection = Get-AzInvoiceSection -BillingAccountName $billing.Name -BillingProfileName $billingprofile.Name


$BILLING_ACCOUNT_NAME = $(${billing}.Name)
$BILLING_PROFILE_NAME = $(${billingprofile}.Name)
$INVOICE_SECTION_NAME = $(${billinginvoicesection}.Name)


terraform init

terraform plan -var "billing_account_name=${BILLING_ACCOUNT_NAME}" -var "billing_profile_name=${BILLING_PROFILE_NAME}" -var "invoice_section_name=${INVOICE_SECTION_NAME}" -out main.tfplan

terraform apply "main.tfplan"

#terraform plan -destroy -var "billing_account_name=${BILLING_ACCOUNT_NAME}" -var "billing_profile_name=${BILLING_PROFILE_NAME}" -var "invoice_section_name=${INVOICE_SECTION_NAME}" -out main.destroy.tfplan

#terraform apply "main.destroy.tfplan"







