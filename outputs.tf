output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.myec2.public_ip
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "elastic_ip" {
  value       = aws_eip.app_eip.public_ip
  description = "Elastic IP of the EC2 instance"
}