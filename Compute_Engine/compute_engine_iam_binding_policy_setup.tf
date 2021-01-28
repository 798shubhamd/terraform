data "google_iam_policy" "oslogin" {
    binding{
        role = "roles/compute.osAdminLogin"
       members = [
           "user:suraj.chaskar@datametica.com", 
       ] 
    }

binding{
        role = "roles/compute.osLogin"
        members = [
            "user:saurabh.thakur@datametica.com",
        ]
    }
}

resource "google_compute_instance_iam_policy" "policy" {
    project = google_compute_instance.create_new_compute_engine.project
    zone = google_compute_instance.create_new_compute_engine.zone
    instance_name = google_compute_instance.create_new_compute_engine.name  
    policy_data = data.google_iam_policy.oslogin.policy_data
}