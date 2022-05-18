
// Create SA
resource "yandex_iam_service_account" "sa" {
  folder_id   = var.folder_id
  name        = var.name
  description = var.description
}

// Grant permissions 
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  for_each = var.roles

  folder_id = var.folder_id
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
  role      = each.value
}

// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "Static access key for object storage. Managed by terraform"
}

output "sa_access_key" {
  description = "ID of the static access key or `null` if `static_access_key` was not set to true."
  value = try(yandex_iam_service_account_static_access_key.sa-static-key.access_key, null)
}

output "sa_secret_key" {
  description = "Private part of generated static access key or `null` if `static_access_key` was not set to true."
  value = try(yandex_iam_service_account_static_access_key.sa-static-key.secret_key, null)
  sensitive = true
}