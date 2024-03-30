

resource "kubernetes_namespace" "test" {
  metadata {
    name = "test-and-practice-alemi"
  }
}

resource "helm_release" "nginx" {
  name       = "nginx-alemi"
  chart      = "./nginx"
  namespace  = "test-and-practice-alemi"
  depends_on = [kubernetes_namespace.test]
}
