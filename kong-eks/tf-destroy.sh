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
# export TF_VAR_instance_types="t3.large"
# export TF_VAR_no_of_public_subnet="2"

cd $tf_code_dir

#Terraform to Destroy EKS Cluster
terraform init -backend-config "path=$tf_code_dir/kong-eks-sandbox.tfstate" -reconfigure

terraform destroy -target module.kubectl
terraform destroy -target module.argocd

sleep 60

terraform destroy -target module.eks-cluster

