provider "google" {
  project = shubham-proj-300807
}

#Compute Engine 
module "compute_engine1" {
    source = "./Compute_Engine/"

    project_name=var.project_name
    instance_name="users_vm"
    machine_type="n1-standard-4"
    zone=var.zone
    region=var.region
    network_tags=var.network_tags
    image="debian-10-buster-v20201216"
    boot_disk_size="20"
    subnetwork_path="projects/shubham-proj-300807/region/us-central1/subnetworks/shubh-vpc-subnet"
    scope=["cloud_platform"]
    username=var.username
    admin_username=var.admin_username
}
#big query
