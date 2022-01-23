terraform init \
    -backend-config="client_id=$ARM_CLIENT_ID" \
    -backend-config="client_secret=$ARM_CLIENT_SECRET" \
    -backend-config="subscription_id=$ARM_SUBSCRIPTION_ID" \
    -backend-config="tenant_id= $ARM_TENANT_ID" \
    -backend-config="billing_account_name= $ARM_BILLING_ACCOUNT_NAME" \
    -backend-config="billing_profile_name= $ARM_BILLING_PROFILE_NAME" \
    -backend-config="invoice_section_name= $ARM_INVOICE_SECTION_NAME" \