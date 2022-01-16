# Terraform! There appears to be no escaping it :-)
The aim of this lab was to have some security when connecting to Azure with terraform init

Step 1 - Create the service connection - "Scripts\01_Create_Terraform_Service_Connection.ps1"
    - Update the variables $env and $projectshortname with what ever you want to use (I only tested this with PowerShell_ISE running in Administrator mode)
    - This script will create an App Registration and secret then create the environment variables Terraform will need to connect to your chosen Azure Tenant
Step 2 - Initialise Terraform
    - open a bash terminal the copy and paste the commands in terraform_init.sh this will initialise Terraform and connect to Azure without any credentials needing to be stored in a file
