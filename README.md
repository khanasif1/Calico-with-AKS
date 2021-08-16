# Present Calico with AKS in 15min

Calico is a container networking solution created by <a href='https://www.tigera.io/'>Tigera</a>. Calico is an open source networking and network security solution for containers, virtual machines, and native host-based workloads. Calico supports a broad range of platforms including Kubernetes, OpenShift, Mirantis Kubernetes Engine (MKE), OpenStack, and bare metal services.

Whether you opt to use Calico's eBPF data plane or Linux’s standard networking pipeline, Calico delivers blazing fast performance with true cloud-native scalability. Calico provides developers and cluster operators with a consistent experience and set of capabilities whether running in public cloud or on-prem, on a single node, or across a multi-thousand node cluster.

<figure class="wp-block-image size-large is-resized"><img src="https://github.com/khanasif1/Calico-with-AKS/blob/main/images/Windows-AKS.png" alt="" class="wp-image-4784" width="753" height="505"/></figure>

<h2>Solution Overviw</h2>

In this solution, I have tried to cover end-to-end steps for experiencing Calico. This solution will be exceptionally relevent to users who have urgent need to demo/quick experience/present Calico implementation with AKS.

The solution has below folder structure:

📦_azure
 ┣ 📂_aks_artifacts
 ┃ ┣ 📂kubectl
 ┃ ┃ ┣ 📜clusterquery.ps1
 ┃ ┃ ┗ 📜deploycomponents.ps1
 ┃ ┣ 📂manage
 ┃ ┃ ┗ 📜aksclustermamagement.ps1
 ┃ ┣ 📂yaml
 ┃ ┃ ┣ 📂application
 ┃ ┃ ┃ ┣ 📜nginx.yaml
 ┃ ┃ ┃ ┣ 📜product.yaml
 ┃ ┃ ┃ ┣ 📜product2.yaml
 ┃ ┃ ┃ ┗ 📜web.yaml
 ┃ ┃ ┗ 📂policy
 ┃ ┃ ┃ ┣ 📜allow_cross_ns_pod.yaml
 ┃ ┃ ┃ ┣ 📜allow_nginx_product.yaml
 ┃ ┃ ┃ ┗ 📜blockall_productpolicy.yaml
 ┃ ┗ 📜_deploy_aks.ps1
 ┗ 📜_login.ps1