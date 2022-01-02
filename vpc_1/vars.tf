variable "AWS_REGION" {
	default = "eu-west-3"
}

variable "AMI" {
    type = "map"
    
    default {
        eu-west-3 = "ami-03dea29b0216a1e03"
    }
}
