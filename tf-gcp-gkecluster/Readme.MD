
### To log in to Google Kubernetes Engine (GKE) from the command-line interface (CLI), you can use the gcloud command-line tool. Here are the steps:

----


1. Install the gcloud command-line tool if you haven't already. You can download and install it from the Google Cloud SDK website: https://cloud.google.com/sdk/docs/install

2. Open your terminal and run the following command to authenticate gcloud with your Google Cloud account:

         gcloud auth login

        This command will open a web page where you can log in with your Google Cloud credentials.(username: general@intverse.io & Password: <your Password>)


3. After you have successfully authenticated, run the following command to configure the 'gcloud' tool to use your GKE cluster:

        gcloud container clusters get-credentials [CLUSTER_NAME] --zone [ZONE] --project [PROJECT_ID]
        
        Replace [CLUSTER_NAME] with the name of your GKE cluster, [ZONE] with the zone where your cluster is located, and [PROJECT_ID] with your Google Cloud project ID.
---
##                       Our Case:- $ gcloud container clusters get-credentials intverse-gke --zone us-central1 --project intverse
---

4. Once you have run the get-credentials command, you should be able to access your GKE cluster from the CLI using kubectl commands. For example, you can run the following command to get a list of nodes in your cluster:

            kubectl get nodes

# That's it! You are now logged in to your GKE cluster from the CLI.