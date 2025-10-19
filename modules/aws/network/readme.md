# AWS Network Iac - Code Explanation

🧩 Terraform Network Module — Explained Clearly

variables.tf → defines inputs your infrastructure needs.

main.tf (the one with your resources) → uses those inputs to create real AWS resources.

⚙️ variables.tf
``` variable "vpc_cidr" { 
  type = string 
}

variable "public_subnets" { 
  type = list(string) 
}

variable "region" { 
  type = string 
} ```

What this means:

These are inputs you must provide when deploying.

They make your configuration flexible and reusable — you can deploy the same setup to different regions or CIDR ranges by just changing variable values.

Example in a terraform.tfvars file:

vpc_cidr       = "10.10.0.0/16"
public_subnets = ["10.10.1.0/24", "10.10.2.0/24"]
region         = "us-east-1"

🏗️ main.tf (Infrastructure Definition)
1. Get all available Availability Zones
``` data "aws_availability_zones" "available" {
  state = "available" ```
}


Terraform queries AWS for a list of available zones (e.g., us-east-1a, us-east-1b, etc.).

You’ll use these zones to distribute subnets across multiple zones for redundancy.

2. Create the VPC
``` resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = { Name = "multi-iac-aws-vpc" }
} ```


Builds a new VPC using the CIDR you passed in (var.vpc_cidr).

Turns on DNS hostnames, allowing EC2 instances to have DNS names.

Adds a descriptive tag so you can easily find it in the AWS console.

3. Create an Internet Gateway
``` resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
} ```


Attaches an Internet Gateway to your new VPC.

This allows any “public” subnet to reach the internet (and vice versa if security allows).

4. Define Public Subnets (from variables)
``` resource "aws_subnet" "public" {
  for_each = { for idx, cidr in var.public_subnets : cidr => idx }

  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.key
  availability_zone       = data.aws_availability_zones.available.names[tonumber(each.value)]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-${each.key}"
  }
} ```


Terraform loops through each subnet CIDR you provided in var.public_subnets.

For each subnet:

It’s placed inside the new VPC.

It gets a CIDR block from your list.

It’s assigned to a different Availability Zone (based on its index).

It’s configured to automatically assign public IPs to instances at launch.

Each subnet is tagged for clarity (e.g. public-10.10.1.0/24).

5. Create a Route Table for Public Internet Access
``` resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  route { 
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.igw.id 
  }
} ```


Creates a route table for public traffic.

The route tells AWS:

“For any destination (0.0.0.0/0), send it through the Internet Gateway.”

This is what allows your subnets to communicate with the public internet.

6. Associate Subnets with the Route Table
``` resource "aws_route_table_association" "a" {
  for_each       = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
} ```


Links each public subnet to the public route table.

Ensures that all instances launched in those subnets can use the Internet Gateway for outbound connections.

7. Outputs
``` output "vpc_id" { value = aws_vpc.this.id }
output "public_subnet_ids" { value = [for s in aws_subnet.public : s.id] } ```


After Terraform runs, it will print:

The VPC ID — useful if another module (like EC2 or EKS) needs to reference it.

The list of public subnet IDs — you can pass these to load balancers, auto-scaling groups, etc.

🧠 Summary: What This Setup Does
Component	Purpose
variables.tf	Lets you define and customize inputs (CIDRs, region, subnets).
aws_vpc	Creates a new virtual private network.
aws_subnet	Creates multiple public subnets across AZs.
aws_internet_gateway	Enables internet access for your public subnets.
aws_route_table	Adds a default route to the internet.
aws_route_table_association	Connects your subnets to that internet route.
outputs	Makes key resource IDs reusable by other Terraform files.

Result →
A scalable, internet-connected AWS VPC, where:

Each subnet sits in a different AZ,

Instances launched inside get public IPs automatically,

Outbound traffic routes through an Internet Gateway.