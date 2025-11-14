# Terraform Modules Library (AWS + Google Cloud)

<!-- Project Badges -->
![Terraform](https://img.shields.io/badge/Terraform-1.7.7-blue?logo=terraform&logoColor=white)
![Terraform fmt](https://img.shields.io/badge/Terraform-fmt-9cf?logo=terraform&logoColor=white)
![Terraform Validate](https://img.shields.io/badge/Terraform-validate-green?logo=terraform&logoColor=white)
![GCP](https://img.shields.io/badge/Google%20Cloud-Platform-blue?logo=googlecloud&logoColor=white)
![Cloud Run](https://img.shields.io/badge/CloudRun-Active-brightgreen)
![License](https://img.shields.io/badge/License-MIT-green)


Reusable, documented Terraform modules for quick, secure cloud provisioning

## Repo Layout

## tf-modules-library

tf-modules-library/
├─ README.md
├─ LICENSE
├─ .gitignore
├─ .editorconfig
├─ Makefile
├─ CONTRIBUTING.md
├─ versions.tf # Shared recommended Terraform versions (for examples)
├─ .github/
│ └─ workflows/
│ └─ tf-validate.yml


<details>
<summary>modules/</summary>



modules/
├─ aws/
│ ├─ network/ # VPC, subnets, IGW, routes
│ ├─ s3-bucket/ # Secure S3 with encryption + lifecycle
│ ├─ iam-role/ # Reusable IAM role + policy attachment
│ └─ lambda-python/ # Zip + Lambda + IAM basic exec
└─ gcp/
├─ network/ # VPC, subnet, firewall rules
├─ storage-bucket/ # GCS bucket with uniform access + lifecycle
├─ service-account/ # SA + roles binding
└─ cloud-run/ # Cloud Run service + IAM invoker


</details>

<details>
<summary>examples/</summary>



examples/
├─ aws-s3-static-site/
│ ├─ main.tf
│ ├─ variables.tf
│ └─ outputs.tf
├─ aws-lambda-hello/
│ ├─ main.tf
│ └─ lambda_src/hello.py
├─ gcp-cloud-run-hello/
│ ├─ main.tf
│ └─ app/ (Dockerfile, main.py)
└─ gcp-storage-logging/
└─ main.tf


</details>

## What’s inside
- **AWS**: `network`, `s3-bucket`, `iam-role`, `lambda-python`
- **GCP**: `network`, `storage-bucket`, `service-account`, `cloud-run`

## Usage
Each module has:
- Clear variables with sensible defaults
- Outputs you actually need
- Minimal opinionated security (encryption, least-privilege, lifecycle)
- An example in `examples/`

## Versioning
- Tag releases semantically: `v0.x.y` (pre-1.0 while iterating)

## Requirements
- Terraform ≥ 1.6
- AWS / gcloud CLIs configured

## Contributing
See `CONTRIBUTING.md`

