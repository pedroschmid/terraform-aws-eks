# Variables
AWS_REGION=us-east-1
AWS_EKS_CLUSTER_NAME=k8s
AWS_VAULT_PROFILE=terraform
BACKEND_FILE_PATH=backend.hcl

# AWS 
login:
	aws-vault login $(AWS_VAULT_PROFILE)
eks-sync:
	aws-vault exec $(AWS_VAULT_PROFILE) -- aws eks --region $(AWS_REGION) update-kubeconfig --name $(AWS_EKS_CLUSTER_NAME)

# Terraform
init:
	aws-vault exec $(AWS_VAULT_PROFILE) --no-session -- terraform init -backend=true -backend-config=$(BACKEND_FILE_PATH)
plan:
	aws-vault exec $(AWS_VAULT_PROFILE) --no-session -- terraform plan
validate:
	terraform validate
apply:
	aws-vault exec $(AWS_VAULT_PROFILE) --no-session -- terraform apply
destroy:
	aws-vault exec $(AWS_VAULT_PROFILE) --no-session -- terraform destroy
fmt:
	terraform fmt --recursive
