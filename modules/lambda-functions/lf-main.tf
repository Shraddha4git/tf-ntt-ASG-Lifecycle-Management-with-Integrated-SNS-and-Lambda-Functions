resource "aws_s3_bucket" "s3_lambda_function_files" {
  bucket        =     "tf-poc-ots-logs" # "tf-scripting-lg-lambda-functions"# "tf-ebs-lambda-function-03-10-24"
   # id                          = "tf-poc-ots-logs"
  force_destroy               = false
   tags                        = {
          "CreatedBy" = "Anil" 
           "Owner"     = "Shraddha" 
           "Product"   = "OTS" 
           "Project"   = "Terraform POC" 
           "Role"      = "TEST" 
        }
}

resource "aws_s3_object" "AsgTerminationLowTg_upload" {
  bucket = aws_s3_bucket.s3_lambda_function_files.bucket
  key    = "AsgTerminationLowTg.zip"
  source = "${path.module}/AsgTerminationLowTg.zip"
}


resource "aws_iam_role" "tf_asg_low_tg_lambda_exec_role" {
  name = "lambda-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}
resource "aws_iam_policy" "tf_asg_low_tg_lambda_policy" {
  name        = "tf-asg-low-tg-lambda-policy"
  description = "Policy for Lambda execution and related actions"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "ssm:SendCommand",
          "autoscaling:CompleteLifecycleAction"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "tf_asg_low_tg_lambda_policy_attachment" {
  role       = aws_iam_role.tf_asg_low_tg_lambda_exec_role.name
  policy_arn = aws_iam_policy.tf_asg_low_tg_lambda_policy.arn
}

resource "aws_lambda_function" "asg_low_tg_lifecycle_lambda" {
  #depends_on    = [aws_s3_object.s0_upload]
  function_name = "AsgTerminationLowTg"
  handler       = "AsgTerminationLowTg.lambda_handler"
  runtime       = "python3.12"
  role          = aws_iam_role.tf_asg_low_tg_lambda_exec_role.arn
  s3_bucket     = aws_s3_bucket.s3_lambda_function_files.bucket #aws_s3_bucket.s3_lambda_function_files.bucket # "tf-ebs-lambda-function-03-10-24"
  s3_key        = "AsgTerminationLowTg.zip"
  timeout = 600
  environment {
    variables = {
     # tf_low_tg_asg_instance_ids = join(", ", var.tf_low_tg_asg_instance_ids)
    }
  }
}


output "AsgTerminationLowTg-lambda-arn" {
 value =   aws_lambda_function.asg_low_tg_lifecycle_lambda.arn
}

resource "aws_lambda_permission" "allow_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.asg_low_tg_lifecycle_lambda.function_name
  principal     = "sns.amazonaws.com" 
  source_arn    = var.tf-asg-low-tg-sns-topic-arn  #"*" #arn:aws:sns:region:account-id:sns-topic-name
}
variable "tf-asg-low-tg-sns-topic-arn" {
  
}
/*
variable "tf_low_tg_asg_instance_ids" {
  
}
*/

