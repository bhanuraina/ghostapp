resource "aws_launch_configuration" "ghost_lc" {
  name_prefix          = "ghost-lc"
  image_id             = data.aws_ami.ubuntu.image_id
  security_groups      = [aws_security_group.ghost_asg_sg.id]
  instance_type        = var.ec2_instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name # here

  lifecycle {
    create_before_destroy = true
  }
}
