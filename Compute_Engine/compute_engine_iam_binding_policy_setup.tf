data "google_iam_policy""oslogin" {
    binding{
        role = "roles/compute.osAdminLogin"
       member = [
            "user=var.admin_username",
        ]
        }

binding{
        role = "roles/compute.osLogin"
        member = [
            "user=var.username",
        ]
    }
}

resource "google_compute_instance_iam_policy" "policy" {
    project = google_compute_instance.create_new_compute_engine.project
    zone = google_compute_instance.create_new_compute_engine.zone
    instance_name = google_compute_instance.create_new_compute_engine.instance_name  
    policy_data = data.google_iam_policy.oslogin.policy_data
}
