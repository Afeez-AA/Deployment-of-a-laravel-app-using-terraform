##################################################################################
# INSTANCES
##################################################################################
resource "aws_instance" "nginx" {
  count                  = var.instance_count
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.public_subnets[(count.index % var.vpc_subnet_count)]
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  key_name               = var.ssh_key

  provisioner "local-exec" {
    command = "echo '${self.public_ip}' >> ./host-inventory"
  }

  tags = {
    Name = "WEB${count.index + 1}"
  }


}

resource "null_resource" "ansible-playbook" {
  provisioner "local-exec" {
    command = "ansible-playbook --private-key ${var.ssh_key}.pem main.yml"
  }

  depends_on = [aws_instance.nginx]
}
#   depends_on = [aws_instance.nginx]
#   }
# }
# provisioner "local-exec" {
#   command = "echo '[web]' >  /home/ubuntu/host-inventory"
# }

# provisioner "local-exec" {
#   command = "echo ${self.public_ip} >>  /home/ubuntu/host-inventory"
# }


# provisioner "local-exec" {
#   command = "ansible-playbook -i host-inventory --private-key ${local.private_key_path} apache2.yml"
# }




