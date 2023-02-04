resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name = var.ssh_key
  public_key = tls_private_key.main.public_key_openssh
}

resource "local_file" "ssh_key" {
  content = tls_private_key.main.private_key_pem
  filename = "${var.ssh_key}.pem"
  file_permission = "0400"
}