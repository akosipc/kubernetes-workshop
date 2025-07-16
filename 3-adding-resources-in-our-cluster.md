# Adding Resources to the Cluster

## Adding the deployment and service

```
kubectl apply -f containers/manifests/deployment.yaml

kubectl apply -f containers/manifests/service.yaml
```

## Adding a HPA for our deployment

```
kubectl apply -f containers/manifests/hpa.yaml
```

## Let's trigger a scale up event in our HPA

```
$ kubectl port-forward svc/hasher-webserver-service 4567:4567


$ while sleep 0.01; do wget -q -O- http://127.0.0.1:4567/test; done
```
