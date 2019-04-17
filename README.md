<h1 align="center">Debug App</h1>

<div align="center">
  :house_with_garden:
</div>
<div align="center">
  <strong>Know more about what's happening and less wtf!</strong>
</div>
<div align="center">
  A <code>simple</code> setup for debugging purposes.
</div>

<br />

<div align="center">
  <!-- Docker Build Status -->
  <a href="https://cloud.drone.io/williamchanrico/debugapp">
    <img src="https://cloud.drone.io/api/badges/williamchanrico/debugapp/status.svg"
      alt="Docker Image Build Status" />
  </a>
  <!-- GPL License -->
  <a href="http://flask.pocoo.org/"><img
	src="https://badges.frapsoft.com/os/gpl/gpl.png?v=103"
	border="0"
	alt="GPL Licence"
	title="GPL Licence">
  </a>
  <!-- Open Source Love -->
  <a href="http://flask.pocoo.org/"><img
	src="https://badges.frapsoft.com/os/v1/open-source.svg?v=103"
	border="0"
	alt="Open Source Love"
	title="Open Source Love">
  </a>
</div>

## Introduction

`docker pull williamchanrico/debugapp:latest`

Simple docker image and k8s template for debugging purposes (debugapp also hosts simple HTTP & HTTPS servers)

`$ curl http://debugapp.testing.svc.cluster.local/`

```json
{
  "host": "debugapp.testing.svc.cluster.local",
  "method": "GET",
  "uri": "/",
  "httpVersion": "1.1",
  "time": "2019-04-17T16:34:51.717436119Z",
  "remoteAddr": "10.13.70.96:45794",
  "tls": false,
  "header": {
    "Accept": [
      "*/*"
    ],
    "Content-Length": [
      "0"
    ],
    "User-Agent": [
      "curl/7.64.0"
    ],
    "X-B3-Sampled": [
      "0"
    ],
    "X-B3-Spanid": [
      "96313377c4dc532f"
    ],
    "X-B3-Traceid": [
      "96313377c4dc532f"
    ],
    "X-Envoy-Decorator-Operation": [
      "debugapp.testing.svc.cluster.local:80/*"
    ],
    "X-Forwarded-Proto": [
      "http"
    ],
    "X-Istio-Attributes": [
      "Cj4KF2Rlc3Rp===TRUNCATED==="
    ],
    "X-Request-Id": [
      "47920061-f78e-45a2-a111-ad50445992a8"
    ]
  },
  "message": "Hello, you've reached DebugApp!"
}
```

## K8s and Istio Support

You can deploy a single pod using `kubectl apply -f k8s/debugapp.yaml`

Check the content of `k8s/debugapp.yaml` for more options (full set of testing namespace, deployment, svc)

Also included istio objects to setup a working istio ingress connection right into debugapp's HTTP port (check in `k8s/istio/`)
