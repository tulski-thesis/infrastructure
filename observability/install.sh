helm install observability \
  -f observability/values.yaml \
  --set "grafana.adminPassword=<adminPassword>" \
  -n observability \
  --create-namespace \
  prometheus-community/kube-prometheus-stack