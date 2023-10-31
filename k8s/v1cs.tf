resource "null_resource" "deploy_v1cs" {
  depends_on = [
    module.eks
  ]
  provisioner "local-exec" {
    command = <<-EOT

    # Add cluster to kubeconfig
    aws --version
    export REGION=$(terraform output -raw region)
    export CLUSTER=$(terraform output -raw cluster_name)
    echo $REGION $CLUSTER
    aws eks --region $REGION update-kubeconfig --name $CLUSTER

    # Create necessary namespaces
    kubectl create namespace tigera-operator
    kubectl create namespace demo
    kubectl create namespace attacker

    # Install Calico
    helm install calico projectcalico/tigera-operator -f deployments/values.yaml --namespace tigera-operator

    # Deploy java-goof
    kubectl apply -f deployments/java-goof.yaml

    # Install Vision One Container Security
    helm install \
    --values deployments/overrides.yaml \
    --namespace "trendmicro-system" \
    --create-namespace \
    trendmicro \
    https://github.com/trendmicro/cloudone-container-security-helm/archive/master.tar.gz

    EOT
  }
}
