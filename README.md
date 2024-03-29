# Present Calico with AKS in 15min

Calico is a container networking solution created by <a href='https://www.tigera.io/'>Tigera</a>. Calico is an open source networking and network security solution for containers, virtual machines, and native host-based workloads. Calico supports a broad range of platforms including Kubernetes, OpenShift, Mirantis Kubernetes Engine (MKE), OpenStack, and bare metal services.

Whether you opt to use Calico's eBPF data plane or Linux’s standard networking pipeline, Calico delivers blazing fast performance with true cloud-native scalability. Calico provides developers and cluster operators with a consistent experience and set of capabilities whether running in public cloud or on-prem, on a single node, or across a multi-thousand node cluster.

<figure class="wp-block-image size-large is-resized"><img src="https://github.com/khanasif1/Calico-with-AKS/blob/main/images/Windows-AKS.png" alt="" class="wp-image-4784" width="753" height="505"/></figure>

<h2>Solution Overviw</h2>

In this solution, I have tried to cover end-to-end steps for experiencing Calico. This solution will be exceptionally relevent to users who have urgent need to demo/quick experience/present Calico implementation with AKS.

The solution has below folder structure:
<figure class="wp-block-image size-large is-resized"><img src="https://github.com/khanasif1/Calico-with-AKS/blob/main/images/folder.JPG" alt="" class="wp-image-4784" width="330" height="386"/></figure>

***

<h2>Deploy the solution</h2>

<ul>
<li><strong>_deploy_aks.ps1</strong> : Deploy a AKS cluster, with network policy as Calico. </li>
<li><strong>kubectl</strong>
            <ol>
                <li><strong>deploycomponents.ps1</strong>: Deploy application components</li>
                <li><strong>clusterquery.ps1</strong>: These are random query for K8s cluster. You may igonore this.</li>
            </ol>
</li>
<li><strong>manage
    <ol><li><strong>aksclustermamagement.ps1</strong>: You can turn on/off your AKS cluster to reduce cost.</li></ol>
</strong></li>
<li><strong>yaml-->application</strong></li>
<li><strong>yaml-->policy</strong></li>
</ul>
