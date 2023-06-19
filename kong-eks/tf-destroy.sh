#Pre-reqs
#1) Install AWSCLI, KUBECTL, aws-iam-authenticator
#2) aws configure (provide access-key & secret)
#3) Install HELM


export tf_code_dir="."

cd $tf_code_dir

#Terraform to Destroy EKS Cluster
terraform init -backend-config "path=$tf_code_dir/kong-eks-sandbox.tfstate" -reconfigure

terraform destroy -target module.kubectl
terraform destroy -target module.argocd

sleep 60

terraform destroy -target module.eks-cluster

