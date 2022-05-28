output "eks_cluster_connection_string" {
  value = "aws eks --region ${var.region} update-kubeconfig --name ${aws_eks_cluster.k8sdemo.name}"
}
