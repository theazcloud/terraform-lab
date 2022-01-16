terraform init \
    -backend-config="client_id=$ARM_CLIENT_ID" \
    -backend-config="client_secret=$ARM_CLIENT_SECRET" \
    -backend-config="subscription_id=$ARM_SUBSCRIPTION_ID" \
    -backend-config="tenant_id= $ARM_TENANT_ID"