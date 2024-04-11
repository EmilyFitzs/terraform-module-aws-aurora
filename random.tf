resource "random_string" "snapshot_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "random_string" "timestamp" {
  length  = 10
  special = false
  upper   = false
  lower   = false
  keepers = {
    time = timestamp()
  }

  override_special = "-_"
}
