resource "aws_iam_role" "ekscluster" {
  name = "eks-cluster-demo"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.ekscluster.name
}

resource "aws_eks_cluster" "k8sdemo" {
  name     = "k8sdemo"
  role_arn = aws_iam_role.ekscluster.arn

  vpc_config {
    security_group_ids = [aws_security_group.demo.id]
    subnet_ids = [
      aws_subnet.public-us-east-1a.id,
      aws_subnet.public-us-east-1b.id,
      aws_subnet.public-us-east-1c.id
    ]
  }
  depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]
}
