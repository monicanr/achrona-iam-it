# Read by the workload/ config (terraform_remote_state) to find the cluster.
output "kube_id" {
  description = "ID of the Managed Kubernetes cluster."
  value       = ovh_cloud_project_kube.this.id
}

# Read by the workload/ config to pull images, and by whoever pushes them.
output "registry_url" {
  description = "URL of the team's container registry (Harbor). Images: <host>/realm/<image>:<tag>."
  value       = ovh_cloud_project_containerregistry.realm.url
}

output "registry_user" {
  description = "Registry user (docker login)."
  value       = ovh_cloud_project_containerregistry_user.realm.user
}

output "registry_password" {
  description = "Registry password: terraform output -raw registry_password"
  value       = ovh_cloud_project_containerregistry_user.realm.password
  sensitive   = true
}
