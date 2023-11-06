variable "cluster_name" {
  description = "Name of the db cluster"
  type        = string
}

variable "usergroups" {
  description = "AD Groups allowed read access"
  type        = list(string)
}

variable "managegroups" {
  description = "AD Groups allowed manage access"
  type        = list(string)
}