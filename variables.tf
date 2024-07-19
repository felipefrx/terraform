variable "aws_region" {
  type = string
  description = ""
  default = "us-east-1"
}

variable "aws_profile" {
  type = string
  description = ""
}

variable "instance_ami" {
  type = string
  description = ""
  default = "ami-03c3a7e4263fd998c"
}

variable "instance_type" {
  type = string
  description = ""
  default = "t3.micro"
}

variable "instance_tags" {
  type = map(string)
  description = ""
  default = {
    Name = "Ubuntu"
    Description = "Project TF"
  }
}
