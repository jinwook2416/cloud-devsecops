variable "project_id" {
    description = "GCP Project_id"
    type = string
}

variable "region" {
    description = "GCP Region"
    type = string
}

variable "credentials_file" { 
    description = "Service Account Key Path"
    type = string
}

variable "instance_name" {
    description = "Instance Name"
    type = string
}

variable "zone" {
    description = "GCP Zone"
    type = string
}