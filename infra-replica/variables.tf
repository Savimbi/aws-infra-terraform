variable "private_subnet" {
  description = "Default private subnets"
  type        = map()
  default = {
    a = "10.0.1.0/24"
    b = "10.0.2.0/24"
  }
}

variable "private_subnet_a" {
}

variable "subnets" {
  type = map()
  default = {
    a = "10.0.1.0/24"
    b = "10.0.2.0/24"
  }
}

variable "tags" {
  description = "Default tags to apply to all resources."
  type        = map(any)
  default = {
    archuuid = "b800b1f4-6929-446e-9a77-9271669c757f"
    env      = "Production"
  }
}

variable "vpc_cidr" {
}

