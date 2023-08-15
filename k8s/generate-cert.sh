#!/bin/bash

# Instructions to generate keygen-server and proxy server ssl cert
## server: tls.key
## proxy: client.key

# Generate Private Key
openssl genrsa -out tls.key 2048
openssl genrsa -out client.key 2048

# Generate CSR (Certificate Signing Request)
openssl req -new -key tls.key -out tls.csr -subj "/CN=api.keygen.localhost"
openssl req -new -key client.key -out client.csr -subj "/CN=keygen-api-service.builtin-infra.svc.cluster.local"

# Generate Self-signed Certificate
openssl x509 -req -in tls.csr -signkey tls.key -out tls.crt
openssl x509 -req -in client.csr -signkey client.key -out client.pem

# Apply to builtin-infra
kubectl create secret tls tls-secret -n builtin-infra --cert=tls.crt --key=tls.key
kubectl create secret generic client-tls-secret -n builtin-infra --from-file=client.pem=./client.pem --from-file=client.key=./client.key --from-file=trusted_ca_cert.crt=./tls.crt