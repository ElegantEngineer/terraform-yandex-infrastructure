
data "yandex_compute_image" "compute_image" {
  family = var.image_family
}

resource "yandex_compute_instance" "this" {
  count       = var.instance_count
  name        = var.name
  platform_id = var.platform_id
  zone        = var.zone
  hostname    = "${var.name}-yc-${count.index + 1}"

  resources {
    cores         = var.cores
    memory        = var.memory
    core_fraction = var.core_fraction
  }

  boot_disk {
    auto_delete = true
    initialize_params {
      name     = "primary-${var.name}-y-${var.region}"
      image_id = data.yandex_compute_image.compute_image.id
      size     = var.primary_disk_size
    }
  }

  dynamic "secondary_disk" {
    for_each = var.secondary_disk
    content {
      auto_delete = lookup(secondary_disk.value, "auto_delete", false)
      disk_id     = yandex_compute_disk.extra-disks[secondary_disk.key].id
    }
  }

  network_interface {
    subnet_id          = var.subnet_id
    nat                = var.is_nat
  }

  metadata = {
    user-data = "${file("./meta-data/meta.txt")}"
  }
}

// Additional disks
resource "yandex_compute_disk" "extra-disks" {
  for_each = var.secondary_disk
  name     = each.key
  size     = each.value["size"]
  type     = var.db_storage_type
  zone     = var.zone
  labels   = var.tags
}

output "internal_ip_address_this" {
  value = yandex_compute_instance.this[*].network_interface.0.nat_ip_address
}

output "external_ip_address_this" {
  value = yandex_compute_instance.this[*].network_interface.0.nat_ip_address
}
