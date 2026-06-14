provider "google" {
  project = var.project_id
  region  = var.region
}

# 1. Zero Trust Key Storage & QKD Simulated Buffer
resource "google_secret_manager_secret" "zt_mesh_key" {
  secret_id = "zt-mesh-key"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret" "qkd_sifted_key" {
  secret_id = "qkd-sifted-key"
  replication {
    auto {}
  }
}

# 2. Long-Term Memory (Firestore in Native Mode)
resource "google_firestore_database" "memory_store" {
  name        = "(default)"
  location_id = var.region
  type        = "FIRESTORE_NATIVE"
}

# 3. Confidential Compute Engine Instance (Hardware Isolated for FHE)
# Uses specialized Confidential VMs to secure data-in-use at the CPU level
resource "google_compute_instance" "hpc_confidential_node" {
  name         = "sol-plex-hpc-node"
  machine_type = "c3-standard-4" # Intel TDX enabled general-purpose instance
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "projects/confidential-vm-images/global/images/family/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {} # Ephemeral IP for routing
  }

  confidential_instance_config {
    enable_confidential_compute = true
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
}
