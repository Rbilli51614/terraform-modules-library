🪣 Terraform AWS S3 Bucket Module








This Terraform module creates a secure, versioned, and optionally encrypted S3 bucket in AWS.
It includes built-in controls for public access blocking, encryption, and lifecycle management — all customizable through variables.

📁 Module Structure
.
├── main.tf          # S3 bucket resources
├── variables.tf     # Input variables for configuration
├── outputs.tf       # Outputs (bucket name)
└── README.md        # Documentation

🚀 Features

✅ Creates an S3 bucket with optional force destroy

🔒 Configurable public access blocking

♻️ Supports lifecycle rules for automatic object expiration

🧾 Enables versioning for object recovery

🔐 Adds encryption at rest (AES-256 or KMS)

🪶 Clean and reusable — works as a Terraform module

⚙️ Example Usage
module "s3_bucket" {
  source = "./modules/s3"  # adjust path if needed

  name                = "my-app-logs-bucket"
  force_destroy       = true
  block_public_access = true
  versioning          = true
  kms_master_key_id   = null
  lifecycle_days      = 30
}

🔧 Inputs (from variables.tf)
Name	Type	Default	Description
name	string	—	Name of the S3 bucket (must be globally unique).
force_destroy	bool	false	If true, allows the bucket to be deleted even if it contains objects.
block_public_access	bool	true	If true, blocks all public access to the bucket.
versioning	bool	true	Enables S3 bucket versioning.
kms_master_key_id	string	null	Optional KMS key ID for encryption. If null, defaults to AES-256.
lifecycle_days	number	30	Number of days before objects expire automatically.
📤 Outputs
Name	Description
bucket	The name of the created S3 bucket.
🧠 How It Works
Resource	Purpose
aws_s3_bucket.this	Creates the actual S3 bucket.
aws_s3_bucket_public_access_block.pab	Blocks all forms of public access.
aws_s3_bucket_versioning.v	Enables or suspends object versioning.
aws_s3_bucket_server_side_encryption_configuration.sse	Applies default encryption (AES-256 or AWS KMS).
aws_s3_bucket_lifecycle_configuration.lc	Automatically expires objects after lifecycle_days.
🪪 Example Output

After running:

terraform apply


You’ll see output similar to:

Outputs:

bucket = "my-app-logs-bucket"

🧩 Integration Tips

You can reuse this module across multiple environments — just change the variable values in your .tfvars files:

dev.tfvars

staging.tfvars

prod.tfvars

Example:

terraform apply -var-file="dev.tfvars"

🏷️ Topics

terraform, aws, s3, iac, devops, security, infrastructure, automation

🛡️ License

This project is licensed under the MIT License
.