# infra4711-tf-web

This repository is used for demo purposes only.

# related links


### Terraform Backend config on Blob Storage
https://docs.microsoft.com/en-us/azure/terraform/terraform-backend

### Azure Key Vault
https://docs.microsoft.com/en-us/azure/key-vault/quick-create-cli

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| location | The location where resources will be created | string | n/a | yes |
| project\_name | Define a project name that everyone can relate to | string | n/a | yes |
| resource\_group\_name | The name of the resource group in which the resources will be created | string | n/a | yes |
| tags | A map of the tags to use for the resources that are deployed | map | n/a | yes |
