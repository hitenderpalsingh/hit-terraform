provider "google" {
  credentials = file("~/line-data/.secrets/key.json")
  project     = var.project
  region      = var.region
}

resource "random_id" "bucket_prefix" {
    byte_length = 8
}

resource "google_storage_bucket" "default"{
    name = "${random_id.bucket_prefix.hex}-my-bucket"
    location = "${var.bucket_location}"
    uniform_bucket_level_access = true
    storage_class = "STANDARD"
    force_destroy = true

    website {
        main_page_suffix = "index.html"
        not_found_page = "404.html"
    }
}

resource "google_storage_bucket_object" "index_page" {
    name = "index-page"
    bucket = google_storage_bucket.default.name
    content = <<-EOT
    <html><body>
    <h1>Congratulation on setting up Google Cloud Run CDN with Storage Backend!</h1>
    </body></html>
    EOT
}

resource "google_storage_bucket_object" "error_page" {
    name = "404-page"
    bucket = google_storage_bucket.default.name
    content = <<-EOT
    <html><body>
    <h1>Error: Object you are looking for is no longer available!</h1>
    </body></html>
    EOT
}

resource "google_storage_bucket_object" "test_image" {
    name = "test-image"
    content = "Data as string to be uploaded"
    content_type = "text/plain"
    bucket = google_storage_bucket.default.name

}

#resource "google_compute_backend_bucket" "default" {
#    name = "cat-backend-bucket"
#    descritption = "Contains beautiful Images"
#    enable_cdn = true
#
#}
