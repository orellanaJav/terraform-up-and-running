variable "server_port" {
  description = "value of the server port"
  default     = 8080
}

variable "cluster_name" {
  description = "The namoe to use for all the cluster resources"
  type        = string
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 Instances to run"
  type        = string
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = string
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = string
}
