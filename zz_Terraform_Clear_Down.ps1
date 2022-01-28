#####################################################################################################################################################
##                                                                                                                                                 ##
## This script removes the AD App Registrations to be used as a Service Connection for Terraform                                                   ##
##                                                                                                                                                 ##
#####################################################################################################################################################

terraform init

terraform plan -destroy -out main.destroy.tfplan

terraform apply "main.destroy.tfplan"

Remove-Item -path .\terraform.tfstate -Force

Remove-Item -path .\terraform.tfstate.backup -Force

Remove-Item -Path .\main.destroy.tfplan

Remove-Item -Path .\main.tfplan


##################### Input Variables #################################################

$env = @('dev')
$projectshortname = "hta"  # Update this variable with your short name for the project

#######################################################################################

$checkAadmodule = get-module AzureAd

if(-not $checkAadmodule){

        Write-Host 'Azure AD Powershell Module needs to be installed'

        Install-Module AzureAD

        Write-Host 'Azure AD PowerShell Mobule installed'


        Write-Host 'Azure AD Powershell Module needs to be imported'

        Import-Module AzureAD -UseWindowsPowerShell

        Write-Host 'Azure AD Module impoerted, we are good to go'

        }
else{

        Write-Host 'Azure AD Module detected, happy days!'

        }


$checkAzmodule = get-module Az

if(-not $checkAzmodule){

        Write-Host 'Azure Powershell Module needs to be installed'

        Install-Module Az

        Write-Host 'Azure PowerShell Mobule installed'


        Write-Host 'Azure Powershell Module needs to be imported'

        Import-Module Az

        Write-Host 'Azure Module impoerted, we are good to go'

        }
else{

        Write-Host 'Azure Module detected, happy days!'

        }


###################### Connect Azure and Azure AD #############################

Connect-AzAccount

Connect-AzureAD

#####################################################################endregion


####################################################################

$SCName = "SC-"+${env}.ToUpper()+"-"+${projectshortname}.ToUpper()

Write-Host "Checking if App Registration $SCName exists"

$mySC = Get-AzureADApplication -Filter "DisplayName eq '$($SCName)'"

Remove-AzureADApplication -ObjectId $mySC.ObjectId

Write-Host "App Regsitration $SCName exists or has now been removed"








