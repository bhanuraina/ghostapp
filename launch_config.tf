resource "aws_launch_configuration" "ghost_lc" {
  name_prefix          = "ghost-lc"
  image_id             = data.aws_ami.ubuntu.image_id
  security_groups      = [aws_security_group.ghost_asg_sg.id]
  instance_type        = var.ec2_instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  associate_public_ip_address = true
  key_name = "cloud_user"
  #  path to the user data file
  user_data = templatefile("./user_script/ghost_init.sh",
    {
      # This is pulled from the rds resource created in rds.tf
      "endpoint" = aws_db_instance.default.address,
      "database" = aws_db_instance.default.name,
      "username" = aws_db_instance.default.username,
      # !!! Remember to find a secure way to retrieve your password
      "password"  = var.mysql_password,
      "admin_url" = "http://${aws_elb.web_elb.dns_name}",
      "url"       = "http://${aws_elb.web_elb.dns_name}" 
    }
  )
}
resource "aws_key_pair" "this" {
  count = var.create_key_pair ? 1 : 0

  key_name        = "cloud"
  public_key      = tls_private_key.this.public_key_openssh

  tags = {
  Name = "Ghost"
  }
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "local_file" "ssh_key" {
  filename = "cloud.pem"
  content = tls_private_key.this.private_key_pem
  depends_on = [aws_key_pair.this]
}
