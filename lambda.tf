resource "aws_iam_role" "iam_for_ghost_lambda" {
  name = "iam_for_ghost_lambda"

  assume_role_policy = <<EOF
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
EOF
}

resource "aws_lambda_function" "ghost_lambda" {
  filename      = "delete_post-a13f3829-2554-49c2-ae71-84915b4b8201.zip"
  function_name = "delete_all_posts_ghosts"
  role          = aws_iam_role.iam_for_ghost_lambda.arn
  handler       = "lambda_function.lambda_handler"

  source_code_hash = filebase64sha256("delete_post-a13f3829-2554-49c2-ae71-84915b4b8201.zip")

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
      Name  = "ghost"
      "Host"     = "database-1.cobxo3snknwp.eu-central-1.rds.amazonaws.com"
      "dbname"   = "mydb"
      "password" = "Ghost#1234"
       "username" = "ghostadmin"
    }
  }
}
