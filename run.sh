#!/bin/bash

helm install small-parrot --create-namespace --namespace infra .
# helm upgrade -i small-parrot  --namespace infra .

kubectl port-forward --namespace infra svc/small-parrot-keygen-api-service 8001:80 > /dev/null 2>&1 &
pid=$!

curl -I http://localhost:8001/v1/ping
kill -9 $pid

# helm uninstall small-parrot --namespace infra
