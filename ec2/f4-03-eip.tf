# Allocate an Elastic IP
resource "aws_eip" "eip" {
  vpc = true
}

# Associate the Elastic IP with the EC2 instance
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.practice.id
  allocation_id = aws_eip.eip.id
}
