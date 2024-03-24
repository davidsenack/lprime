variable "my_ip_address" {
  description = "The IP address allowed for SSH access"
  type        = string
}

variable "instance_key_name" {
  description = "The name of the EC2 key pair to use for SSH access"
  type        = string
}
