#Creating DataProc

resource "google_dataproc_cluster" "creating-dataproc" {
    provider = google-beta
    name= var.dataproc_cluster_name
    region = var.region
    project= var.project_name  

    cluster_config {
        staging_bucket = var.staging_bucket
        master_config {
            num_instance_node=var.master_num_instance_number_node
            machine_type=var.master_machine_type
        disk_config {
             boot_disk_size_gb = var.master_boot_disk_size_gb
                }
            }   

        worker_config {
            num_instances_node = var.worker_num_instances_number_node
            machine_type = var.worker_machine_type
        disk_config {
            boot_disk_size_gb = var.worker_boot_disk_size_gb
                 }
             }

        encryption_config {
            enable_http_port_access = "true"
        }
        gce_cluster_config {
            zone = var.zone
            subnetwork = var.subnetwork
            tags = var.network_tags
            service_account =var.service_acount
            internal_ip_only = true
        }
    }
        lifecycle{
            prevent_destroy = true
        }
}