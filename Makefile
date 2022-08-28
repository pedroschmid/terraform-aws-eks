profile=terraform

init:
	terraform init
validate:
	terraform validate
apply:
	aws-vault exec $(profile) -- terraform apply
destroy:
	aws-vault exec $(profile) -- terraform destroy
fmt:
	terraform fmt --recursive