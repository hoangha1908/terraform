provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}
resource "aws_s3_bucket" "example" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
  bucket = "hoangha1908"
  acl    = "private"
}

# Change the aws_instance we declared earlier to now include "depends_on"

