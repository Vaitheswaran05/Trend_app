variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
}

variable "instance_type" {
  default = "t3.micro"
}