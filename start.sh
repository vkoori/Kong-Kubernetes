PROJECT_NAME="kong"

./kube/CRDs.sh && \
./kube/namespace.sh $NAMESPACE && \
./secret/cert.sh $NAMESPACE $TLS_SECRET_NAME $TLS_BASE64_CRT $TLS_BASE64_KEY && \
./secret/docker.sh $NAMESPACE $DOCKER_SECRET_NAME $DOCKER_BASE64_CONFIG && \
./kong/gateway.sh && \
./kong/helm.sh $NAMESPACE # && \
./kube/vault.sh "$MY_VAULT_TOKEN" "$MY_VAULT_ADDR" "$PROJECT_NAME" "$values_version" values.yaml

if helm status kong -n "$NAMESPACE" >/dev/null 2>&1; then
  helm upgrade --install "$PROJECT_NAME" kong/ingress -n "$NAMESPACE" --values values.yaml
else
  helm install "$PROJECT_NAME" kong/ingress -n "$NAMESPACE" --values values.yaml
fi
