# infra4711-tf-web

This repository is used for demo purposes only.


# Packer Images

### Infos on shared image galleries
https://docs.microsoft.com/en-us/azure/virtual-machines/linux/shared-images?toc=/azure/virtual-machines/windows/toc.json&bc=/azure/virtual-machines/windows/breadcrumb/toc.json

### create an image definition
az sig image-definition create --resource-group <my-rg> --gallery-name <my_shared_image_gallery> --gallery-image-definition <my-ubuntu18> --publisher <company> --offer UbuntuServer --sku 18.04-LTS --os-type linux


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
