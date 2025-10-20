Google Cloud Run Terraform Module

This Terraform configuration deploys a Google Cloud Run service and optionally sets it to allow unauthenticated access. It also outputs the URL of the deployed service.

Resources Created

Cloud Run Service (google_cloud_run_service)

Deploys a containerized application to Cloud Run.

Configurable name, region, and container image.

Cloud Run IAM Member (google_cloud_run_service_iam_member)

Optionally allows public (unauthenticated) access to the service.

Controlled by the allow_unauthenticated variable.

Output

url: The fully qualified URL of the deployed Cloud Run service.

Variables

These variables should be defined in your variables.tf file:

Variable	Type	Description	Example
service_name	string	Name of the Cloud Run service	"my-service"
region	string	Region to deploy the service	"us-central1"
image	string	Container image to deploy	"gcr.io/my-project/my-image:latest"
allow_unauthenticated	bool	Whether to allow public access	true
Example Usage
module "cloud_run_service" {
  source                = "./path-to-module"
  service_name          = "my-service"
  region                = "us-central1"
  image                 = "gcr.io/my-project/my-image:latest"
  allow_unauthenticated = true
}


After applying the Terraform configuration, you can access the service URL using the url output:

terraform output url

Notes

Ensure your Google Cloud project is properly configured and the Cloud Run API is enabled.

If allow_unauthenticated is set to true, the service will be publicly accessible.

Container port is hardcoded to 8080 in this module; update the containers.ports.container_port if needed.