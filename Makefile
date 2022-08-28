# Variables
aws_vault_profile=terraform
backend_file=backend.hcl

# AWS CLI
sync-eks:
	aws eks --region us-east-1 update-kubeconfig --name k8s

# Terraform
init:
	terraform init -backend=true -backend-config=$(backend_file)
plan:
	terraform plan
validate:
	terraform validate
apply:
	aws-vault exec $(aws_vault_profile) --no-session -- terraform apply
destroy:
	aws-vault exec $(aws_vault_profile) --no-session -- terraform destroy
fmt:
	terraform fmt --recursive
