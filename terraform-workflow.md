# Terraform Workflow – First Apply Lab

This document describes the complete Terraform workflow followed during the lab, including each command executed, what it does, and key observations, particularly around Terraform state.

---

## Project Initialization

Command run:
terraform init

What this command does:
Initializes the Terraform working directory, downloads the required AWS provider, and creates the .terraform directory used for local dependencies.

Observations:
This command must be run before any other Terraform command. It is safe to re-run and does not create any infrastructure.

---

## Configuration Validation and Formatting

Commands run:
terraform validate
terraform fmt

What these commands do:
terraform validate checks the configuration files for syntax errors and invalid references without contacting AWS.
terraform fmt formats the Terraform files to a standard style for readability and consistency.

Observations:
These commands help catch mistakes early and keep the code clean but do not affect infrastructure.

---

## Planning Infrastructure Changes

Command run:
terraform plan

What this command does:
Compares the desired configuration defined in the Terraform files with the current state and shows a preview of what resources will be created, modified, or destroyed.

Observations:
No changes are made to AWS. This acts as a safety checkpoint before applying changes and clearly showed the S3 bucket resources that would be created.

---

## Applying Infrastructure

Command run:
terraform apply

What this command does:
Applies the planned changes, creates the AWS resources, and updates the Terraform state file to reflect the real infrastructure.

Observations:
Terraform required confirmation before execution. The S3 bucket was created successfully with versioning enabled, and the state file was updated.

---

## Viewing Outputs

Command run:
terraform output

What this command does:
Displays the output values defined in the Terraform configuration, such as the S3 bucket name, ARN, and region.

Observations:
Outputs are useful for verification and for passing values to other Terraform configurations.

---

## Inspecting Terraform State

Commands run:
terraform show
terraform state list
terraform state show aws_s3_bucket.lab_bucket

What these commands do:
terraform show displays the entire Terraform state in a human-readable format.
terraform state list shows all resources tracked by Terraform.
terraform state show displays detailed information about a specific resource.

Observations:
These commands confirmed that Terraform state is the source of truth and showed how Terraform tracks real AWS resources.

---

## Modifying Existing Infrastructure

After adding server-side encryption to the S3 bucket configuration, the following commands were re-run:
terraform plan
terraform apply

Observations:
Terraform detected that the bucket already existed and applied only the encryption changes, demonstrating Terraform’s ability to modify infrastructure safely without recreating resources.

---

## Destroying Infrastructure

Command run:
terraform destroy

What this command does:
Destroys all resources tracked in the Terraform state file and removes them from AWS in the correct dependency order.

Observations:
Terraform required confirmation before destruction. All resources were deleted successfully, ensuring no ongoing AWS costs.

---

## Summary

This lab demonstrated the full Terraform lifecycle from initialization to destruction. It reinforced the importance of Terraform state and showed how Infrastructure as Code enables safe, repeatable, and auditable infrastructure management.