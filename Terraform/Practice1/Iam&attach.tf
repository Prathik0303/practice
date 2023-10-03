provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

# Create an IAM role
resource "aws_iam_role" "example_role" {
  name = "example-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

# Attach an admin access policy to the IAM role
resource "aws_iam_policy_attachment" "example_role_policy" {
  role       = aws_iam_role.example_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Update the EC2 instance to use the IAM role
resource "aws_instance" "example_instance" {
  ami                    = "ami-0c94855ba95c71c99"  # Amazon Linux 2 AMI ID
  instance_type          = "t2.micro"
  iam_instance_profile   = aws_iam_role.example_role.name
}
