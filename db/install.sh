helm install store-db \
        --set auth.postgresPassword="<postgresPassword>" \
        --set auth.username="store-db-admin" \
        --set auth.password="<password>" \
        -f db/values.yaml \
        -n store \
        --create-namespace \
        oci://registry-1.docker.io/bitnamicharts/postgresql