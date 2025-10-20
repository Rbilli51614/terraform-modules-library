# 🔐 Terraform AWS IAM Role Module  

[![Terraform](https://img.shields.io/badge/Terraform-1.7%2B-7B42BC?logo=terraform)](https://www.terraform.io/)
[![AWS IAM](https://img.shields.io/badge/AWS-IAM-FF9900?logo=amazon-aws)](https://aws.amazon.com/iam/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Build Status](https://img.shields.io/badge/Build-Passing-brightgreen)]()
[![IaC Module](https://img.shields.io/badge/IaC-Terraform-blueviolet)]()

---

## 📘 Overview  

This Terraform module creates a **custom AWS IAM Role** with an **inline policy** and a specified **assume role policy**.  
It’s ideal for use with AWS services (like Lambda, EC2, or ECS) that need tightly scoped IAM roles.

The module allows you to:
- Define which service can assume the role (e.g., `lambda.amazonaws.com`)  
- Attach a custom inline policy (using JSON)  
- Output the role’s ARN for easy integration into other Terraform resources  

---

## 🧩 Files Included  

- **main.tf** → Core IAM role and policy creation logic  
- **variables.tf** → Input variables (see example below)  
- **outputs.tf** → Exports the created role ARN  

---

## 🧠 How It Works  

| Component | Description |
|------------|-------------|
| `data "aws_iam_policy_document"` | Builds a JSON assume-role policy for a trusted AWS service. |
| `aws_iam_role` | Creates the IAM role using the assume-role policy. |
| `aws_iam_policy` | Defines a custom inline IAM policy from your input JSON. |
| `aws_iam_role_policy_attachment` | Attaches the inline policy to the role. |
| `output "role_arn"` | Outputs the ARN of the created IAM role. |

---

## 🧾 Example `variables.tf`

```hcl
variable "name" {
  description = "Name of the IAM role"
  type        = string
}

variable "assume_role" {
  description = "AWS service that assumes the role (e.g., lambda.amazonaws.com)"
  type        = string
}

variable "policy_json" {
  description = "JSON-formatted IAM policy document for this role"
  type        = string
}
🚀 Example Usage
hcl
Copy code
module "iam_role" {
  source        = "./modules/iam-role"
  name          = "lambda-execution-role"
  assume_role   = "lambda.amazonaws.com"

  policy_json = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "arn:aws:s3:::my-bucket/*"
      }
    ]
  })
}
This will:

Create a role named lambda-execution-role

Allow Lambda to assume it

Grant it S3 read/write access to the specified bucket

📤 Outputs
Name	Description
role_arn	ARN of the created IAM Role

🧰 Requirements
Name	Version
Terraform	≥ 1.7
AWS Provider	≥ 5.0

🧪 Example Folder Structure
css
Copy code
terraform-modules-library/
└── iam-role/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    ├── README.md
🪪 License
This module is released under the MIT License.
You are free to modify and reuse it in your own Terraform projects.

💡 Tips
The assume_role variable controls which AWS service can use this role (e.g., EC2, ECS, Lambda).

You can replace the inline policy_json with a JSON file using:

hcl
Copy code
policy_json = file("${path.module}/policy.json")
Combine this with other modules (like Lambda or EC2) to create complete IAM-managed environments.