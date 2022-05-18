resource "yandex_vpc_network" "this" {
  name        = var.name
  description = "${var.description} ${var.name}"
  labels      = var.tags
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "${var.name}-${var.zone}"
  description    = "${var.description} ${var.name} subnet for zone ${var.zone}"
  v4_cidr_blocks = ["${var.subnet}"]
  zone           = var.zone
  network_id     = yandex_vpc_network.this.id
  labels         = var.tags

  depends_on = [
    yandex_vpc_network.this
  ]
}

output "subnet_id" {
  value = yandex_vpc_subnet.subnet.id
}