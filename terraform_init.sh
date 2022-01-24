cd Templates
terraform init -backend-config="client_id=$ARM_CLIENT_ID" -backend-config="client_secret=$ARM_CLIENT_SECRET" \
    -backend-config="subscription_id=$ARM_SUBSCRIPTION_ID" \
    -backend-config="tenant_id= $ARM_TENANT_ID" \


$env:billing_account_name= $ARM_BILLING_ACCOUNT_NAME

export TF_VAR_billing_account_name= $ARM_BILLING_ACCOUNT_NAME
terraform apply
export TF_VAR_billing_profile_name= $ARM_BILLING_PROFILE_NAME
export TF_VAR_invoice_section_name= $ARM_INVOICE_SECTION_NAME


terraform plan out main.tfplan -chdir