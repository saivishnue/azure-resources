
variable "accountTier" {
  description = "Account type"
  type = string
  default = "Standard"
}

variable "replicationType" {
  description = "Type of replication"
  type = string
  default = "LRS"
}

variable "name" {
  description = "Name for the resource"
  default = "nonprod"
}

variable "rg-name" {
  description = "Name of rg"
}

variable "resource_group_loc" {
  default ="westus2"
}
