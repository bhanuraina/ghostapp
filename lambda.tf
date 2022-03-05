resource "aws_iam_role" "iam_for_ghost_lambda"{
  name = "iam_for_ghost_lambda"

  assume_role_policy = <<-POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_lambda_function" "poc" {
  filename      = "./lambda/ghost_lambda.zip"
  function_name = "delete_all_posts_ghosts"
  role          = aws_iam_role.iam_for_ghost_lambda.arn
  handler       = "lambda_function.lambda_handler"

  source_code_hash = filebase64sha256("./lambda/ghost_lambda.zip")

  runtime = "python3.8"
  vpc_config {
           security_group_ids = [
               "aws_security_group.ghost_asg_sg.id",
            ]
           subnet_ids         = [
               aws_subnet.public_us_east_1a.id,
               aws_subnet.public_us_east_1b.id
            ]
        }
  environment {
    variables = {
      Name     = "ghost"
      Host     = aws_db_instance.default.endpoint
      dbname   = var.mysql_dbname
      username = var.mysql_username
      password = var.mysql_password
    }
  }
}
