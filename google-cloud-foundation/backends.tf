terraform {
  backend "gcs" {
    bucket = "cs-tfstate-europe-north2-b625732f90f84b83b41fa6c967b37506"
    prefix = "terraform"
  }
}
