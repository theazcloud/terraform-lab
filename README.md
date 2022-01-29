# Terraform! There appears to be no escaping it :-)
The aim of this lab was to have some security when connecting to Azure with terraform init

Step 1 - Create the service connection - Open a seesion of PowerShell ISE in Adminisrator mode then run "\terraform-lab\PS_ISE_Scripts\PS_ISE_Create_Terraform_Service_Connection.ps1"
    - Update the variables below with your chosen values
    - $env,
    - $projectshortname
    - $cliXMLOutputPath

    - This script will create an App Registration and secret, create the environment and subscription variables then exports them to temporary files for use by the next scripts

Step 2 - Deploy initial LZ using Azure Enterprise Scale Module - update the Input Variables in \terraform-lab\01_Terraform-Initial_Setup.ps1 then run the script which will connect to Azure and deploy the Management Group structure, policies and subscriptions


