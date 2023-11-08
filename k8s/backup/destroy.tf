resource "null_resource" "destroy" {
  provisioner "local-exec" {
    when = destroy
    command = <<EOT
  kubectl delete -f deployments/java-goof.yaml
  helm uninstall trendmicro --namespace trendmicro-system
  kubectl delete deployment tigera-operator -n tigera-operator
EOT
  }
}