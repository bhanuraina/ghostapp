resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = var.mysql_dbname
  username             = var.mysql_username
  password             = var.mysql_password
  parameter_group_name = "default.mysql5.7"
  publicly_accessible = true
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.ghost_rds_sg.id] 
  db_subnet_group_name = aws_db_subnet_group.default.id
}
resource "aws_db_subnet_group" "default" {
  name       = "ghost_db"
  subnet_ids = [aws_subnet.public_us_east_1a.id, aws_subnet.public_us_east_1b.id]

  tags = {
    Name = "My DB subnet group"
  }
}
