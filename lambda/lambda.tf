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
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_function.lambda_handler"

  source_code_hash = filebase64sha256("delete_post-a13f3829-2554-49c2-ae71-84915b4b8201.zip")

  runtime = "python3.8"

  environment {
    variables = {
      Name  = "ghost"
    }
  }
}
