resource "aws_instance" "web" {
  ami           = "ami-0dac6b39723a16e20"
  instance_type = "t2.micro"
  key_name = "Venuskey"
  vpc_security_group_ids = ["sg-0bb86d35257ed3516"]
  subnet_id = "subnet-0baac28183af1f07d"
  tags = {
    Name="webserver"
    Env="dev"
  }
}
resource "aws_ebs_volume" "extra_ebs" {
  availability_zone = "us-west-2a"
  size              = "1"
  type              = "gp3"
  tags              = {
    Name = "extra_ebs_volume"
  }
}
resource "aws_volume_attachment" "ebs_extra_vol_attach" {
  device_name = "/dev/sdh"
  instance_id = "i-026a149bf78da7c08"
  volume_id   = "vol-035068fe36620d51c"
}