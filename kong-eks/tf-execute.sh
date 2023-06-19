#Pre-reqs
#1) Install AWSCLI, KUBECTL, aws-iam-authenticator
#2) aws configure (provide access-key & secret)
#3) Install HELM

export tf_code_dir="."

cd $tf_code_dir

#Terraform to Deploy EKS Cluster
terraform init -backend-config "path=$tf_code_dir/kong-eks-sandbox.tfstate" -reconfigure
terraform plan -target module.eks-cluster
terraform apply -target module.eks-cluster

aws eks --region us-east-2 update-kubeconfig --name kong-eks-sandbox


#Terraform to Deploy ArgoCD
terraform plan -target module.argocd
terraform apply -target module.argocd


# #Terraform to execute kubectl commands
terraform plan -target module.kubectl
terraform apply -target module.kubectl