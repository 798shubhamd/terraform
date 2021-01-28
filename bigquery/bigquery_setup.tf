resource "google_bigquery_dataset" "dataset_table1" {
    project = var.project_name
    dataset_id = "head_dataset1"
    location = var.location
}
#role groupWriter
resource "google_bigquery_dataset_access" "dataset_table1_rgw" {
    project = var.project_name
    dataset_id = google_bigquery_dataset.dataset_table1.dataset_id
    role = "WRITER"
    user_by_email="saurabh.thakur@datametica.com"
}

#role groupReader
resource "google_bigquery_dataset_access" "dataset_table1_grr" {
    project = var.project_name
    dataset_id = google_bigquery_dataset.dataset_table1.dataset_id
    role = "READER"
    user_by_email="abhishek.kumar@datametica.com"
}

# #role userReader
# resource "google_bigquery_dataset_access" "dataset_table1_rur" {
#     project = var.project_name
#     dataset_id = google_bigquery_dataset.dataset_table1_rur.dataset_id
#     role = "READER"
#     for_each = toset(var.dataset_table1_rur)
#     user_by_email = each.key
# }

# #role UserWriter
# resource "google_bigquery_dataset_access" "dataset_table1_ruw" {
#     project = var.project_name
#     dataset_id = google_bigquery_dataset.dataset_table1_ruw.dataset_id
#     role = "WRITER"
#     for_each = toset(var.dataset_table1_ruw)
#     user_by_email = each.key