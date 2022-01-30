#####################################################################################################################################################
##                                                                                                                                                 ##
## This script creates the AD App Registrations to be used as a Service Connection for Terraform                                                   ##
##                                                                                                                                                 ##
#####################################################################################################################################################

##################### Input Variables #################################################

$env = @('dev')
$projectshortname = "hta"  # Update this variable with your short name for the project
$cliXMLOutput = 'D:\Temp\env-vars.clixml'
$subInfoOutput = 'D:\Temp\sub-vars.clixml'


#######################################################################################

$checkAadmodule = get-module AzureAd

if(-not $checkAadmodule){

        Write-Host 'Azure AD Powershell Module needs to be installed'

        Install-Module AzureAD

        Write-Host 'Azure AD PowerShell Mobule installed'


        Write-Host 'Azure AD Powershell Module needs to be imported'

        Import-Module AzureAD

        Import-Module AzureAD

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

Write-Host "look for login prompt in new window"

Connect-AzAccount
$context=Get-AzContext
Connect-AzureAD -TenantId $context.Tenant.TenantId -AccountId $context.Account.Id
Write-Host 'Connected to Azure and Azure AD'

#####################################################################endregion

$context = Get-AzContext

$Sub = Get-AzSubscription -SubscriptionName $context.SubscriptionName

$Tenant = Get-AzTenant

####################################################################

$SCName = "SC-"+${env}.ToUpper()+"-"+${projectshortname}.ToUpper()

Write-Host "Checking if App Registration $SCName exists"

if(-not($mySC = Get-AzureADApplication -Filter "DisplayName eq '$($SCName)'" -ErrorAction SilentlyContinue))
{

        $appURI = "https://"+$SCName.ToLower()

        $mySC = New-AzureADApplication -DisplayName $SCName -Homepage $appURI -ReplyUrls $appURI
}
Write-Host "App Regsitration $SCName exists or has now been created"


$SC = Get-AzureADApplication -SearchString $SCName


$Secrets = Get-AzureADApplicationPasswordCredential -ObjectId $SC.ObjectId -ErrorAction SilentlyContinue

if(-not $Secrets){

        Write-Host "No secrets all good to go"
        }
else{


        foreach($Key in $secrets){

        Remove-AzureADApplicationPasswordCredential -KeyId $key.KeyId -ObjectId $SC.ObjectId

        }

}

Remove-Variable Secrets

$startDate = Get-Date
$endDate = $startDate.AddHours(8)
$aadApisecret = New-AzureADApplicationPasswordCredential -ObjectId $SC.ObjectId -CustomKeyIdentifier "Terraform Connection secret" -StartDate $startDate -EndDate $endDate


$env:ARM_CLIENT_ID=$(${SC}.AppId)
$env:ARM_SUBSCRIPTION_ID=$(${Sub}.Id)
$env:ARM_TENANT_ID=$(${Tenant}.Id)
$env:ARM_CLIENT_SECRET=$(${aadApisecret}.Value)


gci env:ARM_* | Export-Clixml -Path $cliXMLOutput


$billing  = Get-AzBillingAccount

$billingprofile = Get-AzBillingProfile -BillingAccountName $billing.Name

$billinginvoicesection = Get-AzInvoiceSection -BillingAccountName $billing.Name -BillingProfileName $billingprofile.Name


$BILLING_ACCOUNT_NAME = $(${billing}.Name)
$BILLING_PROFILE_NAME = $(${billingprofile}.Name)
$INVOICE_SECTION_NAME = $(${billinginvoicesection}.Name)


$Sub_Dependencies = @{

    BILLING_ACCOUNT_NAME = $BILLING_ACCOUNT_NAME;
    BILLING_PROFILE_NAME = $BILLING_PROFILE_NAME;
    INVOICE_SECTION_NAME = $INVOICE_SECTION_NAME
}


$Sub_Dependencies |  Export-Clixml -Path $subInfoOutput

Write-Host "All done here, you can close Powershell ISE it's off to VS Code for everything else"

