output "vpc_id" {
  value = aws_vpc.this.id
}

output "cloudtrail_bucket" {
  value = aws_s3_bucket.trail.id
}

output "flow_log_group" {
  value = aws_cloudwatch_log_group.flow.name
}
