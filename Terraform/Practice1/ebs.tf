provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

# Create an EBS volume
resource "aws_ebs_volume" "example_ebs_volume" {
  availability_zone = "us-east-1a"  # Change to your desired availability zone
  size              = 8  # Change to your desired EBS volume size (in GB)
}

# Create an EC2 instance and attach the EBS volume
resource "aws_instance" "example_instance" {
  ami                    = "ami-0c94855ba95c71c99"  # Amazon Linux 2 AMI ID
  instance_type          = "t2.micro"
  iam_instance_profile   = aws_iam_role.example_role.name
  availability_zone      = "us-east-1a"  # Change to your desired availability zone

  # EBS volume attachment
  ebs_block_device {
    device_name = "/dev/sdf"  # Change to your desired device name
    volume_id   = aws_ebs_volume.example_ebs_volume.id
    delete_on_termination = true  # Set to true to delete the volume when the instance is terminated
  }
}
