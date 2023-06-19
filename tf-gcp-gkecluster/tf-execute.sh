#Pre-reqs
#1) Install gcloud cli, KUBECTL
#2) Install HELM

export TF_VAR_project_id="apigatewaysandbox"
export TF_VAR_cluster_name="kong-sandbox"
export TF_VAR_region="us-central1"
export TF_VAR_location="us-central1-f"

terraform init --backend-config=backend.config -reconfigure

#Terraform to Deploy GKE Cluster
terraform plan -target module.gke-cluster -compact-warnings
terraform apply -target module.gke-cluster -compact-warnings

gcloud container clusters get-credentials $TF_VAR_cluster_name --region $TF_VAR_location --project $TF_VAR_project_id

#Terraform to Deploy ArgoCD
terraform plan -target module.argocd -compact-warnings
terraform apply -target module.argocd -compact-warnings

#Terraform to Deploy kubectl commands
terraform plan -target module.kubectl -compact-warnings
terraform apply -target module.kubectl -compact-warnings
