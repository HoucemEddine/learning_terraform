variable "AWS_REGION" {
	default = "eu-west-3"
}

variable "AMI" {
    type = map(string)
    
    default = {
        eu-west-3 = "ami-03dea29b0216a1e03"
        eu-west-2 = "ami-03dea29b0216a1e03"
    }
}

variable "PRIVATE_KEY_PATH" {
  default = "key-pair-1"
}

variable "PUBLIC_KEY_PATH" {
  default = "key-pair-1.pub"
}

variable "EC2_USER" {
  default = "ubuntu"
}
