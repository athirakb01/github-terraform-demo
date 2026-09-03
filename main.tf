
# enabling API
resource "google_project_service" "compute" {
service = "compute.googleapis.com"
disable_on_destroy = false
}

#create vpc
resource "google_compute_network" "vpc" {
    name = "my-vpc"
    auto_create_subnetworks = false
    depends_on = [google_project_service.compute]
}

#create subnets 
resource "google_compute_subnetwork" "subnet" {
  name = "my-subnet"
  region = "europe-west1"
  ip_cidr_range = "10.20.1.0/24"
  network = google_compute_network.vpc.id
}

# create vm
resource "google_compute_instance" "vm" {
    name = "my-vm"
    machine_type = "e2-medium"
    zone = "europe-west1-b"
    boot_disk {
        initialize_params {
            image = "debian-11-bullseye-v20240415"
            size = 20
        }
    }
    network_interface {
        network = google_compute_network.vpc.id
        subnetwork = google_compute_subnetwork.subnet.id
    }
}

/*
data "google_compute_network" "existingvpc" {
    name = "default"
    project = "project-32294c92-6824-409d-940"
}

output "vpc_self_link" {
    value = "data.google_compute_instance-compute_network.vpc.self_link"
}
*/
