#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=invisibilia/first:firsttry

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run housing-price --image=$dockerpath

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
name=`kubectl get pods --no-headers -o custom-columns=":metadata.name"`
kubectl port-forward $name 8888:80

#kubectl expose deployment housing-price --type=LoadBalancer --port=8888