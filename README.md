Step 0 : Ensure you are in the cloned directory

Step 1 : Populate the SPN variables

$ export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000" $ export ARM_CLIENT_SECRET="00000000-0000-0000-0000-000000000000" $ export ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000" $ export ARM_TENANT_ID="00000000-0000-0000-0000-000000000000"

Step 2 :

Populate variables as shown in example nonprod/nonprod.tfvars with the values you need

Step 3 : terraform init

Step 4 : ( Append Variable File - Example Below) terraform plan -var-file="./nonprod/nonprod.tfvars"

Step 5 : terraform apply -var-file="./nonprod/nonprod.tfvars" or If you are running in the automated environment add --auto-approve terraform apply -var-file="./nonprod/nonprod.tfvars" --auto-approve

Formating the document to adhere with Terraform, use the following command terraform fmt --recursive

Use the following command to provide human readable output from a plan file terraform show [path]
