data "azurerm_shared_image_version" "image" {

  name                = "${var.shared_image_version}"

  image_name          = "${var.shared_image_name}"

  gallery_name        = "${var.shared_image_gallery_name}"

  resource_group_name = "${var.shared_image_resource_group}"

}