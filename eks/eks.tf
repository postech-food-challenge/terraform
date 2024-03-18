resource "aws_iam_role" "eks_cluster" {
  name = "eks-cluster"

  assume_role_policy = jsonencode(
    {
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Service" : "eks.amazonaws.com"
          },
          "Action" : "sts:AssumeRole"
        }
      ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks_cluster.name
}

resource "aws_iam_role_policy_attachment" "amazon_eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

  role = aws_iam_role.eks_cluster.name
}

resource "aws_eks_cluster" "eks" {
  name     = "eks"
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true

    subnet_ids = [
      module.networking.public-subnet-id-1,
      module.networking.public-subnet-id-2,
      module.networking.private-subnet-id-1,
      module.networking.private-subnet-id-2,
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_cluster-AmazonEKSVPCResourceController
  ]
}