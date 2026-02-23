# CE Lab – First Terraform Apply

## Overview
This lab introduces the core Terraform workflow by creating, modifying, and destroying AWS infrastructure using Infrastructure as Code (IaC). The goal was to understand how Terraform manages resources, state, and changes safely.

---

## Lab Objectives Completed

- Set up a first Terraform project
- Write basic Terraform configuration files
- Use the Terraform workflow: init, plan, apply
- Create AWS resources using Terraform
- Understand Terraform state
- Modify existing infrastructure safely
- Destroy resources to avoid unnecessary costs

---

## Resources Created

The following AWS resources were created using Terraform:

- **S3 Bucket**
  - Globally unique name
  - Tagged for identification
  - Versioning enabled
  - Server-side encryption enabled (AES256)

---

## 🖥️ Commands Executed

The following Terraform commands were used during the lab:

- `terraform init`
- `terraform validate`
- `terraform fmt`
- `terraform plan`
- `terraform apply`
- `terraform output`
- `terraform destroy`

---

## Challenges Faced & Solutions

### Issue: Safe Infrastructure Changes
- **Challenge:** Understanding how Terraform handles updates without recreating resources.
- **Solution:** Used `terraform plan` before every apply to preview changes and confirm only the intended modifications would occur.

---

## Key Learnings

- Terraform uses a **declarative approach** to infrastructure.
- The **state file** is critical and should never be committed to version control.
- `terraform plan` is essential for safe changes.
- Terraform can modify existing resources without destroying them.
- Infrastructure can be fully cleaned up using `terraform destroy`.

---

## Screenshots

Screenshots demonstrating the Terraform workflow and AWS verification:

- Terraform initialization  
  ![Terraform Init](screenshots/01-terraform-init.png)

- Terraform plan  
  ![Terraform Plan](screenshots/02-terraform-plan.png)

- Successful apply  
  ![Terraform Apply](screenshots/03-terraform-apply-success.png)

- AWS S3 Console verification  
  ![S3 Verification](screenshots/04-s3-console-verification.png)

- Terraform outputs  
  ![Terraform Outputs](screenshots/05-terraform-outputs.png)

- Resource destruction  
  ![Terraform Destroy](screenshots/06-terraform-destroy.png)