variable "project_id" {
  type = string
}

variable "gcp_region" {
  default = "us-central1"
}

variable "gcp_zone" {
  default = "us-central1-a"
}

variable "machine_type" {
  default = "e2-micro"
}
