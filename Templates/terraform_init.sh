terraform init \
    -backend-config="client_id=$ARM_CLIENT_ID" \
    -backend-config="client_secret=$ARM_CLIENT_SECRET" \
    -backend-config="subscription_id=$ARM_SUBSCRIPTION_ID" \
    -backend-config="tenant_id= $ARM_TENANT_ID" \


export ARM_BILLING_ACCOUNT_NAME  $ARM_BILLING_ACCOUNT_NAME
export ARM_BILLING_PROFILE_NAME  $ARM_BILLING_PROFILE_NAME
export ARM_INVOICE_SECTION_NAME  $ARM_INVOICE_SECTION_NAME