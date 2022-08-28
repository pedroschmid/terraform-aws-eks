aws-vault-profile=terraform

# AWS CLI
sync-eks:
	aws eks --region us-east-1 update-kubeconfig --name k8s

# Terraform
init:
	terraform init
validate:
	terraform validate
apply:
	aws-vault exec $(aws-vault-profile) --no-session -- terraform apply
destroy:
	aws-vault exec $(aws-vault-profile) --no-session -- terraform destroy
fmt:
	terraform fmt --recursive
