# Debug App

[![Build Status](https://cloud.drone.io/api/badges/williamchanrico/debugapp/status.svg)](https://cloud.drone.io/williamchanrico/debugapp)

`docker pull williamchanrico/debugapp:latest`

Simple docker image and k8s template for debugging purposes (debugapp also hosts simple HTTP & HTTPS servers)

```json
$ curl -H 'Host: localhost' http://127.0.0.1/
{
  "host": "localhost",
  "method": "GET",
  "uri": "/",
  "httpVersion": "1.1",
  "time": "2019-04-17T16:09:36.195490849Z",
  "remoteAddr": "127.0.0.1:40592",
  "tls": false,
  "header": {
    "Accept": [
      "*/*"
    ],
    "User-Agent": [
      "curl/7.64.0"
    ]
  },
  "message": "Hello, you've reached DebugApp!"
}
```

## K8s and Istio Support

You can deploy a single pod using `kubectl apply -f k8s/debugapp.yaml`

Check the content of `k8s/debugapp.yaml` for more options (full set of testing namespace, deployment, svc)

Also included istio objects to setup a working istio ingress connection right into debugapp's HTTP port (check in `k8s/istio/`)
