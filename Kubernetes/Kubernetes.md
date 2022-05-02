# Kubernetes
- [Kubernetes](#kubernetes)
  - [Commands](#commands)
  - [Architecture](#architecture)
    - [etcd](#etcd)
    - [Kube-sched](#kube-sched)
    - [Kube-proxy](#kube-proxy)
    - [Kube Controller Manager](#kube-controller-manager)
    - [Kubelet](#kubelet)
    - [ReplicaSet](#replicaset)
  - [Rolling Update & Rollback](#rolling-update--rollback)
    - [Rolling Update](#rolling-update)
    - [Rollback](#rollback)
  - [Backups](#backups)
    - [Obtenir les configs de tout le cluster:](#obtenir-les-configs-de-tout-le-cluster)
    - [Backup and restore etcd:](#backup-and-restore-etcd)
  - [TLS et Certificats](#tls-et-certificats)
  - [RBAC](#rbac)
    - [Security context](#security-context)
  - [Stockage](#stockage)
    - [Volumes](#volumes)
    - [Persistent Volume (PV)](#persistent-volume-pv)
    - [PV Claim](#pv-claim)
  - [Upgrade](#upgrade)
  - [Réseau](#réseau)
    - [CNI](#cni)
    - [DNS](#dns)
    - [Ingress](#ingress)
  - [kubeadm](#kubeadm)
  - [Troubleshooting](#troubleshooting)



## Commands

> kubectl run nginx --image=nginx --dry-run=client -o yaml > fichier.yaml
> kubectl get po/deploy/svc/node/replicaset/... -o yaml > fichier.yaml

 
## Architecture

https://fbiljic.ddns.net/index.php/s/5bjWNGdXqbSSNaC/preview

### etcd
Stockage des informations liées au cluster K8S

> Grâce à etcd, les applications cloud-native sont davantage disponibles et restent fonctionnelles même en cas de défaillance d'un serveur. Les applications lisent et écrivent des données dans etcd. Ce magasin distribue ensuite les données de configuration afin d'assurer la redondance et la résilience de la configuration des nœuds.

### Kube-sched
Décider où va être deployé une ressource

>The scheduler finds feasible Nodes for a Pod and then runs a set of functions to score the feasible Nodes and picks a Node with the highest score among the feasible ones to run the Pod. The scheduler then notifies the API server about this decision in a process called binding.

### Kube-proxy
Exposer les différentes pods dans un cluster à l'extérieur et à l'intérieur

### Kube Controller Manager
Surveille les workers

### Kubelet 

Client Kubernetes: 
>The kubelet is the primary "node agent" that runs on each node. It can register the node with the apiserver using one of: the hostname; a flag to override the hostname; or specific logic for a cloud provider.

>The kubelet works in terms of a PodSpec. A PodSpec is a YAML or JSON object that describes a pod. The kubelet takes a set of PodSpecs that are provided through various mechanisms (primarily through the apiserver) and ensures that the containers described in those PodSpecs are running and healthy. The kubelet doesn't manage containers which were not created by Kubernetes.



### ReplicaSet
- Nombre de pods replicas, monitore l'état des pods, si un pod tombe, un autre est lancé
- Template -> Modèle de pod qui doit être créé
  
## Rolling Update & Rollback

### Rolling Update
>kubectl set image deployment(kind)/myapp-deployment(name) nginx-container(container name)=nginx:1.9.1(image)
### Rollback
>kubectl rollout undo deployment/myapp-deployment

## Backups
### Obtenir les configs de tout le cluster: 
>kubectl get all --all-namespaces -o yaml > all_services.yaml
### Backup and restore etcd: 
  >etcdctl snapshot save snapshot.db

  >etcdctl snapshot restore snapshot.db

  >service etcd restart

## TLS et Certificats

Clé publique -> Certificat .crt
Clé privé -> Key .key

Kube-api server, Etcd server, Kubelet -> Chacun a son .crt et son .key

## RBAC

>kubectl get roles

>kubectl create role developer --verb=create --verb=list --resource=pods

>kubectl create rolebinding dev-user-binding --role=developer --user=dev-user

>kubectl get po --as=dev-user

>kubectl edit role developer -n blue
### Security context
>kubectl exec podname -- whoami -> user that is running the container

## Stockage
### Volumes
Données persistentes gardées après la fin d'un pod. 
Peut être local ou distant ou cloud public
### Persistent Volume (PV)
> A PersistentVolume (PV) is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes. It is a resource in the cluster just like a node is a cluster resource. PVs are volume plugins like Volumes, but have a lifecycle independent of any individual Pod that uses the PV.
https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistent-volumes
### PV Claim
> A PersistentVolumeClaim (PVC) is a request for storage by a user. It is similar to a Pod. Pods consume node resources and PVCs consume PV resources. Pods can request specific levels of resources (CPU and Memory). Claims can request specific size and access modes (e.g., they can be mounted ReadWriteOnce, ReadOnlyMany or ReadWriteMany, see AccessModes).

https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims

## Upgrade 
A revoir!
>kubeadm upgrade plan

>kubeadm upgrade apply

Voir version: 
>kubectl get nodes -o wide

Installer une version spécifique:
>apt install kubeadm=1.19.0-00

>apt install kubelet=1.19.0-00

>systemctl restart kubelet

>ssh workernode
Avant de modifier:
>kubectl drain node-1
[Upgrade]
>kubectl uncordon node-1

## Réseau
### CNI
### DNS
### Ingress

## kubeadm
https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/

## Troubleshooting
