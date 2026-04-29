provider "google" {
  project = "riskpredictionsystem"
  region  = "us-west1"
}

resource "google_storage_bucket" "analytics_bucket" {
  name          = "healthcare-risk-bucket-12345"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true
}

# BigQuery Dataset (optional but looks good)
resource "google_bigquery_dataset" "dataset" {
  dataset_id = "healthcare_dataset"
  location   = "US"
}
