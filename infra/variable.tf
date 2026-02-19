
variable "env" {
   description = "Define about the environent in which resource is provisioned"
   type = string
}

variable "ami" {
   description = "Define about the type of machine image"
   type = string
}

variable "count_of_instance" {
   description = "Define the number of instances"
   type = number
}

variable "instance_type" {
   description = "Define type of instance"
   type = string
}

variable "instance_name" {
   description = "Name of instance"
   type = string
}

variable "instance_vol" {
   description = "volume of instance"
   type = number
}

