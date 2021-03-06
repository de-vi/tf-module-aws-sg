variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "create_security_group" {
  description = "create the security group"
  type        = bool
  default     = true
}

variable "vpc_id" {
  type = string
}

variable "security_group_id" {
  type    = string
  default = ""
}

variable "ingress_security_group_rules" {
  description = "List of cross security group rules"
  type        = list(map(string))
  default     = []
}

variable "ingress_cidr_rules" {
  description = "List of cidr block rules"
  type        = list(map(string))
  default     = []
}

variable "egress_security_group_rules" {
  description = "List of cross security group rules"
  type        = list(map(string))
  default     = []
}

variable "egress_cidr_rules" {
  description = "List of cidr block rules"
  type        = list(map(string))
  default     = []
}

variable "tags" {
  description = "Tags to apply to security group"
  type        = map(string)
  default     = {}
}
