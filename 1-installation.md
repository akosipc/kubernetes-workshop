# Installation Guide

Before we start, we need to install a few things that will make our lives easier. Here's a list of tools that we'll need for the workshop:

- [asdf.vm](https://asdf-vm.com/)
- [minikube](https://github.com/alvarobp/asdf-minikube)
- [kubectl](https://github.com/asdf-community/asdf-kubectl)
- [kubectx](https://github.com/virtualstaticvoid/asdf-kubectx)


## Why asdf.vm?

I like to use [asdf.vm](https://asdf-vm.com/) since it manages my Ruby, Golang and NodeJS version easily. It was surprising to me that there are community plugins for minikube, kubectl and kubectx. Also, if you are using platform specific tools like eksctl or aws-cli, they should have community plugins for that as well.

## Starting minikube

```
$ minikube start

## You should see an output like this:

😄  minikube v1.24.0 on Ubuntu 18.04
🎉  minikube 1.28.0 is available! Download it: https://github.com/kubernetes/minikube/releases/tag/v1.28.0
💡  To disable this notice, run: 'minikube config set WantUpdateNotification false'

✨  Using the docker driver based on existing profile
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
🔄  Restarting existing docker container for "minikube" ...
🐳  Preparing Kubernetes v1.22.3 on Docker 20.10.8 ...
🔎  Verifying Kubernetes components...
    ▪ Using image kubernetesui/dashboard:v2.3.1
    ▪ Using image k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
    ▪ Using image kubernetesui/metrics-scraper:v1.0.7
    ▪ Using image k8s.gcr.io/ingress-nginx/controller:v1.0.4
    ▪ Using image k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
    ▪ Using image k8s.gcr.io/metrics-server/metrics-server:v0.4.2
    ▪ Using image upmcenterprises/registry-creds:1.10
🔎  Verifying ingress addon...
🌟  Enabled addons: storage-provisioner, registry-creds, ingress, default-storageclass, metrics-server, dashboard

❗  /home/realm/.asdf/shims/kubectl is version 1.19.4, which may have incompatibilites with Kubernetes 1.22.3.
    ▪ Want kubectl v1.22.3? Try 'minikube kubectl -- get pods -A'
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

## Let's verify if kubectl, kubectx, and kubens works

```
$ kubectl get all

## There should be a service for kubernetes

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   9d
```

```
$ kubectx

## This should display kubectl clusters that you have in your ~/.kube/config. If you haven't added anything before, you should only see minikube
```

```
$ kubens

## This will display all namespaces in your kubernetes cluster. Since we just started minikube, you should only see default.
```

## Install minikube addons to make our lives easier

```
$ minikube addons enable registry-creds
$ minikube addons enable metrics-server
$ minikube addons enable dashboard
$ minikube addons enable ingress
```
