data "template_file" "custom-data" {
  template = filebase64("${path.module}/custom-data.sh")

}

