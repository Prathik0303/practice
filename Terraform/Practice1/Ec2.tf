provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99"  # Amazon Linux 2 AMI ID
  instance_type = "t2.micro"
  key_name      = "your-existing-key-pair-name"  # Replace with your key pair name

  tags = {
    Name = "ExampleInstance"
  }
}
