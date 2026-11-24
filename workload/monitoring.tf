# The cluster's monitoring stack: a Helm chart in charts/kube-monitoring.
# Terraform installs it and upgrades it when the chart changes. Bump `version`
# in the chart's Chart.yaml whenever you change a template.
resource "helm_release" "monitoring" {
  name      = "kube-monitoring"
  chart     = "${path.module}/charts/kube-monitoring"
  namespace = "observability"

  create_namespace = true
  wait             = true
  timeout          = 600

  set = [
    {
      name  = "ingress.domain"
      value = var.ingress_domain
    },
  ]
}
