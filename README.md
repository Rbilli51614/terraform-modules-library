# Terraform Modules Library (AWS + Google Cloud)

Reusable, documented Terraform modules for quick, secure cloud provisioning

## Repo Layout

tf-modules-library/
├─ README.md
├─ LICENSE
├─ .gitignore
├─ .editorconfig
├─ Makefile
├─ CONTRIBUTING.md
├─ versions.tf          # shared recommended TF versions (for examples)
├─ .github/
│  └─ workflows/
│     └─ tf-validate.yml
├─ modules/
│  ├─ aws/
│  │  ├─ network/           # VPC, subnets, IGW, routes
│  │  ├─ s3-bucket/         # Secure S3 with encryption + lifecycle
│  │  ├─ iam-role/          # Reusable IAM role + policy attachment
│  │  └─ lambda-python/     # Zip + Lambda + IAM basic exec
│  └─ gcp/
│     ├─ network/           # VPC, subnet, firewall rules
│     ├─ storage-bucket/    # GCS bucket with uniform access + lifecycle
│     ├─ service-account/   # SA + roles binding
│     └─ cloud-run/         # Cloud Run service + IAM invoker
└─ examples/
   ├─ aws-s3-static-site/
   │  ├─ main.tf
   │  ├─ variables.tf
   │  └─ outputs.tf
   ├─ aws-lambda-hello/
   │  ├─ main.tf
   │  └─ lambda_src/hello.py
   ├─ gcp-cloud-run-hello/
   │  ├─ main.tf
   │  └─ app/ (Dockerfile, main.py)
   └─ gcp-storage-logging/
      └─ main.tf

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

