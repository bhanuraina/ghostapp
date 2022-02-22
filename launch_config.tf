resource "aws_launch_configuration" "ghost_lc" {
  name_prefix          = "ghost-lc"
  image_id             = data.aws_ami.ubuntu.image_id
  security_groups      = [aws_security_group.ghost_asg_sg.id]
  instance_type        = var.ec2_instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  #  path to the user data file
  user_data = templatefile("./user_data/ghost_init.sh",
    {
      # This is pulled from the rds resource created in rds.tf
      "endpoint" = aws_db_instance.default.address,
      "database" = aws_db_instance.default.name,
      "username" = aws_db_instance.default.username,
      # !!! Remember to find a secure way to retrieve your password
      "password"  = var.mysql_password,
      "admin_url" = var.website_admin_url,
      "url"       = var.website_url
    }
  )
}
