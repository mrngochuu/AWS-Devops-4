#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=mrngochuu/kubenetes-predict

# Step 2
# Run the Docker Hub container with kubernetes
rpod=$(kubectl get pod kubenetes-predict 2> /dev/null;echo $?)
if [ "_$rpod" == "_1" ] ; then
        kubectl run kubenetes-predict \
        --image=$dockerpath \
        --image-pull-policy="Always" \
        --overrides='{"apiVersion": "v1", "spec":{"imagePullSecrets": [{"name": "secretkey"}]}}'
fi

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward kubenetes-predict 8080:80