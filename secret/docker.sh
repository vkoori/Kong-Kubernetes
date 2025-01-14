if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <namespace> <name> <base64-docker-config>"
  exit 1
fi

NAMESPACE="$1"
DOCKER_SECRET_NAME="$2"
DOCKER_BASE64_CONFIG="$3"

if kubectl get secret $DOCKER_SECRET_NAME &> /dev/null; then
  echo "Secret $DOCKER_SECRET_NAME already exists."
else
  cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: $DOCKER_SECRET_NAME
  namespace: $NAMESPACE
type: kubernetes.io/dockerconfigjson
data:
  .dockerconfigjson: >-
    $DOCKER_BASE64_CONFIG
EOF
fi
