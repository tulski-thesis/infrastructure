helm install cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --values cert-manager/index.yaml \
  --version v1.13.1 jetstack/cert-manager