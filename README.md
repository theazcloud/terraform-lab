# Terraform! There appears to be no escaping it :-)
The aim of this lab was to have some security when connecting to Azure with terraform init

Step 1 - Create the service connection - "01_Terraform_Initial_Setup.ps1"
    - Update the variables $env and $projectshortname with what ever you want to use
    - This script will create an App Registration and secret then create the environment variables Terraform will then connect to the Azure Tenant you logged in with and created the Service Principal
