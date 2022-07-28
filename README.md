
# Ascent Solution: Turbonomics-automation

Please return to [your solution](https://ascent.cloudnativetoolkit.dev/solutions/1613aa1e-712d-4a69-a104-bf5831add532) to make changes.

This collection of IBM Cloud terraform automation bundles has been crafted from a set of Terraform modules created by Ecosytem Lab team part of the IBM Strategic Partnership. Please contact Matthew Perrins mjperrin@us.ibm.com, Sean Sundberg seansund@us.ibm.com, Andrew Trice amtrice@us.ibm.com or Noé Samaille noe.samaille@ibm.com for more details.

## Change Log

- **Mon Apr 25 2022** - Initial version

## Description

Solution based on Turbonomic, Maximo Application Core in Quick-Start reference architecture deployed on AWS with Portworx Enterprise as storage option.

## Bill Of Materials used in this solution

| ID | Name | Description | 
| -- | ---- | ----------- |
| 200-aws-openshift-gitops | [200 - AWS OpenShift GitOps Bootstrap](https://ascent.cloudnativetoolkit.dev/boms/200-aws-openshift-gitops) | Provisions OpenShift GitOps into an existing AWS cluster and bootstraps it to a gitops repository |
| 105-aws-vpc-openshift | [105 - AWS VPC OpenShift](https://ascent.cloudnativetoolkit.dev/boms/105-aws-vpc-openshift) | AWS VPC and Red Hat OpenShift servers |
| 220-dev-tools | [220 - OpenShift development tools](https://ascent.cloudnativetoolkit.dev/boms/220-dev-tools) | Provisions development tools in an OpenShift cluster |
| 210-aws-portworx-storage | [210 - AWS - Portworx Cluster Storage](https://ascent.cloudnativetoolkit.dev/boms/210-aws-portworx-storage) | Installs Portworx in and OCP cluster on AWS |
| 200-openshift-gitops | [200 - OpenShift GitOps Bootstrap](https://ascent.cloudnativetoolkit.dev/boms/200-openshift-gitops) | Provisions OpenShift GitOps (ArgoCD) into an existing cluster and bootstraps it to a gitops repository |
| 202-turbonomic-ibmcloud-storage-class | [202 - Turbonomic Storage Class - IBM Cloud](https://ascent.cloudnativetoolkit.dev/boms/202-turbonomic-ibmcloud-storage-class) | GitOps deployment of Storage Class for IBM Cloud OpenShift environment |
| 250-turbonomic-multicloud | [250 - Turbonomic on OpenShift - Multi Cloud](https://ascent.cloudnativetoolkit.dev/boms/250-turbonomic-multicloud) | GitOps deployment of Turbonomic on Multi Cloud environments AWS, Azure and IBM Cloud |
| 400-mas-core-multicloud | [400 - Maximo Application Suite Core](https://ascent.cloudnativetoolkit.dev/boms/400-mas-core-multicloud) | GitOps deployment of Maximo Application Suite Core for OpenShift |

    