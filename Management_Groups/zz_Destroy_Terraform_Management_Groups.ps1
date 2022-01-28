﻿#####################################################################################################################################################
##                                                                                                                                                 ##
## This script creates Management Groups defined in the main.tf                                                   ##
##                                                                                                                                                 ##
#####################################################################################################################################################

terraform init

terraform plan -destroy -out main.destroy.tfplan

terraform apply "main.destroy.tfplan"







