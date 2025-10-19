# Terraform Modules Library (AWS + Google Cloud)

Reusable, documented Terraform modules for quick, secure cloud provisioning.

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

