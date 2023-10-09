helm repo add kyverno https://kyverno.github.io/kyverno/

helm repo update

helm install registry twuni/docker-registry \
  -f registry/values.yaml \
  --set secrets.htpasswd="<htpasswd>" \
  -n registry \
  --create-namespace

kubectl wait --for=condition=ready pods -n registry -l release=registry

kubectl create secret docker-registry regcred \
  --docker-server=registry.tulski.com \
  --docker-username=admin \
  --docker-password="<password>" \
  -n registry

helm install kyverno kyverno/kyverno -n kyverno --create-namespace

kubectl apply -f registry/sync-regcred-secret-policy.yaml
kubectl apply -f registry/add-image-pull-secret-policy.yaml
