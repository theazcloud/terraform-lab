#####################################################################################################################################################
##                                                                                                                                                 ##
## This script creates the initial Terraform connection to the chosen Azure Tenant                                                                 ##
##                                                                                                                                                 ##
#####################################################################################################################################################

######################## Input Variabbles ###############################

$cliXMLPath = 'D:\Temp'

$GithubPath = 'D:\Github'

##########################################################################

Import-CliXml -path $cliXMLPath\env-vars.clixml | ForEach-Object { Set-Item "env:$($_.Name)" $_.Value }

Get-ChildItem env:ARM_*

Remove-Item -path $cliXMLPath\env-vars.clixml -Force

Get-ChildItem env:ARM_*

Set-Location -path $GithubPath\terraform-lab

terraform init

terraform plan -out main.tfplan

terraform apply "main.tfplan"







