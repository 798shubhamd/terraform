resource "google_compute_instance" "create_new_compute_engine" {
    project = var.project_name
    name = var.instance_name
    machine_type = var.machine_type
    zone=var.zone

    service_account {
        email=var.service_account_email
        #To allow full access to all Cloud APIs, use the cloud-platform scope.
      scopes=var.scope
    }
    #A list of network tags to attach to the instance
    tags = var.network_tags
    can_ip_forward = false

    boot_disk{
        initialize_params {
            image = var.image
        }
    }
    
    network_interface {
        subnetwork = var.subnetwork_path
    }
    lifecycle{
        prevent_destroy=false
    }
}
#
# resource "google_compute_address" "internal_address" {
#    project = var.project_name
 #   name = "${var.instance_name}-static-int-ip"
  #  subnetwork= var.subnetwork_path #(project/project_name/region/us-central1/subnetworks/subnet_name)
   # address_type = "INTERNAL"
    #region = var.region
    
    #lifecycle {
     #   prevent_destroy = true
    #}