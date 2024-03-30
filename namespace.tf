resource "kubernetes_namespace" "example" {
  metadata {
    name = "test-and-practice-alemi"
  }
}
resource "kubernetes_resource_quota" "example" {
  metadata {
    name = "my-app-quata"
  }
  spec {
    hard = {
      pods = 10
    }
    scopes = ["BestEffort"]
  }
}
resource "kubernetes_limit_range_v1" "example" {
  metadata {
    name = "nginx-limit"
    namespace = "test-and-practice-alemi"
  }
  spec {
    limit {
      type = "Pod"
      max = {
        cpu    = "200m"
        memory = "1024Mi"
      }
    }
    limit {
      type = "Container"
      default = {
        cpu    = "50m"
        memory = "24Mi"
      }
    }
  }
}