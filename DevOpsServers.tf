provider "aws" {
  region = var.region
}

resource "aws_key_pair" "mykeypair" {
  key_name   = var.key_name
  public_key = file(var.public_key)
}

resource "aws_instance" "my_machine" {
  for_each = toset(var.my-servers)

  ami                    = var.ami_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.sg_id]
  instance_type          = var.ins_type

  tags = {
    Name = each.key
  }
  provisioner "local-exec" {
    command = <<-EOT
			echo [${each.key}]
			echo ${self.public_ip}
		EOT
  }
}

