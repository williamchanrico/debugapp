# Debug App

[![Build Status](https://cloud.drone.io/api/badges/williamchanrico/debugapp/status.svg)](https://cloud.drone.io/williamchanrico/debugapp)

`docker pull williamchanrico/debugapp:latest`

Simple docker image and k8s template for debugging purposes (the app also hosts a simple HTTP server on port 80)

## K8s and Istio Support

You can deploy a single pod using `kubectl apply -f k8s/debugapp.yaml`

Check the content of `k8s/debugapp.yaml` for more options (full set of testing namespace, deployment, svc)

Also included istio objects to setup a working istio ingress connection right into debugapp's HTTP port (check in `k8s/istio/`)
