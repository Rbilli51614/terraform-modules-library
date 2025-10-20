# ⚡ Terraform AWS Lambda Module  

[![Terraform](https://img.shields.io/badge/Terraform-1.7%2B-7B42BC?logo=terraform)](https://www.terraform.io/)
[![AWS Lambda](https://img.shields.io/badge/AWS-Lambda-FF9900?logo=amazon-aws)](https://aws.amazon.com/lambda/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Build Status](https://img.shields.io/badge/Build-Passing-brightgreen)]()
[![IaC Module](https://img.shields.io/badge/IaC-Terraform-blueviolet)]()

---

## 📘 Overview  

This Terraform module automates the **packaging, role creation, and deployment** of an AWS Lambda function.  
It uses the **Archive provider** to zip your source code and defines a **Lambda IAM role** with the basic execution policy.  

You can use this module as a foundation for serverless workloads or event-driven architectures on AWS.

---

## 🧩 Files Included  

- **main.tf** → Core Lambda deployment logic (the code below)  
- **variables.tf** → Input variable definitions (see example below)  
- **outputs.tf** → Exports the Lambda function ARN  

---

## 🧠 How It Works  

| Component | Description |
|------------|-------------|
| `archive_file` | Zips your source code into `package.zip` for Lambda deployment. |
| `aws_iam_role` | Creates an IAM role for the Lambda function to assume. |
| `aws_iam_role_policy_attachment` | Attaches the `AWSLambdaBasicExecutionRole` policy. |
| `aws_lambda_function` | Deploys the zipped function with runtime, handler, and timeout from variables. |
| `output "lambda_arn"` | Exports the Lambda function ARN for use in other modules. |

---

## 🧾 Example `variables.tf`

```hcl
variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "runtime" {
  description = "Lambda runtime (e.g., python3.9, nodejs18.x)"
  type        = string
}

variable "handler" {
  description = "Function handler (e.g., index.handler)"
  type        = string
}

variable "entry_file" {
  description = "Path to the source file to package and deploy"
  type        = string
}

variable "timeout" {
  description = "Function timeout in seconds"
  type        = number
  default     = 10
}
🚀 Example Usage
hcl
Copy code
module "lambda_function" {
  source         = "./modules/lambda"
  function_name  = "my-serverless-fn"
  runtime        = "python3.9"
  handler        = "lambda_function.lambda_handler"
  entry_file     = "${path.module}/lambda_function.py"
  timeout        = 15
}
This will:

Zip your lambda_function.py file

Create an IAM role for Lambda

Deploy the Lambda function with the provided runtime and handler

📤 Outputs
Name	Description
lambda_arn	ARN of the deployed Lambda function

🧰 Requirements
Name	Version
Terraform	≥ 1.7
AWS Provider	≥ 5.0
Archive Provider	≥ 2.0

🧪 Example Folder Structure
css
Copy code
terraform-modules-library/
└── lambda/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    ├── lambda_function.py
    └── README.md
🪪 License
This module is released under the MIT License.
Feel free to modify and use it in your own Terraform projects.

📦 Outputs Preview
Output Name	Example Value
lambda_arn	arn:aws:lambda:us-east-1:123456789012:function:my-serverless-fn
