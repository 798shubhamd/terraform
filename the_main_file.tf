provider "google" {
  project ="shubham-proj-300807"
}

#Compute Engine 
module "compute_engine1" {
    source = "./Compute_Engine/"

    project_name="shubham-proj-300807"
    instance_name="users-vm"
    machine_type="n1-standard-4"
    zone=var.zone
    network_tags=var.network_tags
    image="debian-10-buster-v20201216"
    subnetwork_path="projects/shubham-proj-300807/region/us-central1/subnetworks/shubh-vpc-subnet"
    service_account_email ="433683338826-compute@developer.gserviceaccount.com"
    scope=["cloud-platform"]
}
#big query
module "bigquery1" {
    source = "./bigquery/"

  project_name="shubham-proj-300807"
  location =var.location



}

#DataProc
module "dataproc_cluster" {
  source = "./dataproc"
  
  project_name=var.project_name
  dataproc_cluster_name = "shubham-dataproc-cluster"
  region=var.region
  zone=var.zone
  subnetwork= "projects/shubham-proj-300807/region/us-central1/subnetworks/shubh-vpc-subnet"
  staging_bucket=""
 #master cofig
  master_num_instance_number_node = "1"
  master_machine_type = "n1-standard-8"
  master_boot_disk_size_gb="50"
  #worker Config
  worker_num_instances_number_node="2"
  worker_machine_type = "n1-standard-8"
  worker_boot_disk_size_gb = "100"
  network_tags=var.network_tags
  service_acount = "433683338826-compute@developer.gserviceaccount.com
        shubham.deshmukh@datametica.com"
}