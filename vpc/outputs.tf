output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.this.cidr_block
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.this.id
}

output "public_subnet_ids" {
  description = "Map of public subnet IDs"
  value = {
    for key, subnet in aws_subnet.public :
    key => subnet.id
  }
}

output "private_subnet_ids" {
  description = "Map of private subnet IDs"
  value = {
    for key, subnet in aws_subnet.private :
    key => subnet.id
  }
}

output "public_subnet_arns" {
  description = "Map of public subnet ARNs"
  value = {
    for key, subnet in aws_subnet.public :
    key => subnet.arn
  }
}

output "private_subnet_arns" {
  description = "Map of private subnet ARNs"
  value = {
    for key, subnet in aws_subnet.private :
    key => subnet.arn
  }
}

output "public_route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public.id
}

output "private_route_table_ids" {
  description = "Map of private route table IDs"
  value = {
    for key, route_table in aws_route_table.private :
    key => route_table.id
  }
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = try(aws_nat_gateway.this[0].id, null)
}

output "nat_gateway_eip" {
  description = "Elastic IP of the NAT Gateway"
  value       = try(aws_eip.nat[0].public_ip, null)
}
