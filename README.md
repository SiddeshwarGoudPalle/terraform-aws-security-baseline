# terraform-aws-security-baseline

A small Terraform configuration that applies a basic security baseline to an AWS account.

## What it creates

- VPC with an empty default security group (deny all) and VPC flow logs to CloudWatch (365-day retention)
- Multi-region CloudTrail with log file validation, delivering to a private, versioned, encrypted S3 bucket that denies non-TLS access
- Account-level S3 Block Public Access
- IAM account password policy (14+ chars, rotation, reuse prevention)
- EBS encryption by default

## Use

```bash
terraform init
terraform plan -var name=acme-sec
terraform apply -var name=acme-sec
```

Requires Terraform >= 1.5 and AWS provider >= 5.0, with credentials that can create the resources above. Applying changes account-wide settings (password policy, S3 and EBS defaults), so try it in a sandbox account first. Run `terraform fmt` and `terraform validate` before applying.

## Notes

- Uses SSE-S3 for the trail bucket to stay simple; swap in a KMS key for stricter setups.
- Scope is deliberately small. Check the result with a scanner such as [aws-cspm-scanner](https://github.com/SiddeshwarGoudPalle/aws-cspm-scanner).
