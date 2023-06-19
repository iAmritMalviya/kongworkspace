#Pre-reqs
#1) Install AWSCLI, KUBECTL, aws-iam-authenticator
#2) aws configure (provide access-key & secret)
#3) Install HELM

export TF_VAR_project_id="apigatewaysandbox"
export TF_VAR_cluster_name="kong-sandbox"
export TF_VAR_region="us-central1"
export TF_VAR_location="us-central1-f"

terraform init --backend-config=backend.config -reconfigure

gcloud container clusters get-credentials $TF_VAR_cluster_name --region $TF_VAR_location --project $TF_VAR_project_id

#Terraform to Destory ArgoCD
terraform destroy -target module.argocd
#Terraform to Destroy GKE Cluster
terraform destroy -target module.gke-cluster

