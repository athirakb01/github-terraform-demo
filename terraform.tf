terraform {
    required_version = ">= 1.0"
    required_providers {
        google = {
          source = "hashicorp/google"
           version = "~> 5.0"
        }
   }
}

provider "google" {
  project = "project-32294c92-6824-409d-940"
  region  = "europe-west1"
}