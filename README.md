# Terraform template for a for a minimalistic EC2 setup with SSM enabled

### Usage:
With [terraform](https://www.terraform.io/) installed and configured, simply do:

1. `terraform init`
2. `terraform apply`
3. pass the naming convention for created reources (i.e. "foo" for creating a "foo EC2" instance and a "foo-role" role).

If your AWS profile and credentials are set up to use an admin (or another IAM role with sufficient permissions to create and configure resources), then you won't be needing any changes in the code.

Moreover, with properly set up `~/.aws/profile` and `~/.aws/credentials` you should also be able to simply

```
aws ssm start-session --target i-0aabbcc9876543210
```
where `i-0aabbcc9876543210` of course is the EC2 instance's identifier.
