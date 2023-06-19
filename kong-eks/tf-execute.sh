#Pre-reqs
#1) Install AWSCLI, KUBECTL, aws-iam-authenticator
#2) aws configure (provide access-key & secret)
#3) Install HELM

export tf_code_dir="."

#Terraform Variables
# export TF_VAR_aws_region="us-east-1"
# export TF_VAR_cluster_name="kong-sandbox"
# export TF_VAR_vpc_cidr_block="172.91.0.0/16"
# export TF_VAR_disk_size="20"
# export TF_VAR_instance_types="t3.medium"
# export TF_VAR_no_of_public_subnet="2"

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