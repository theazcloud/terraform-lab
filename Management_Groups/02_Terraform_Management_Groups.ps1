#####################################################################################################################################################
##                                                                                                                                                 ##
## This script creates Management Groups defined in the main.tf                                                   ##
##                                                                                                                                                 ##
#####################################################################################################################################################

terraform init

terraform plan -out main.tfplan

terraform apply "main.tfplan"

terraform plan -destroy -out main.destroy.tfplan

terraform apply "main.destroy.tfplan"







