terraform {
    backend "gcs" {
        bucket = "terrfaom_state_bucket"
        prefix = "terraform/state"
    }
}