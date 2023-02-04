##################################################################################
# LOCALS
##################################################################################
locals {
  common_tags = {
    company      = var.company
    project      = "${var.company}-${var.project}"
    project_code = var.project_code
  }
  # ssh_user         = "ubuntu"
  # key_name         = "az"
  # private_key_path = "./az.pem"
}

