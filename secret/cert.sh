if [ "$#" -ne 4 ]; then
  echo "Usage: $0 <namespace> <name> <base64-crt> <base64-key>"
  exit 1
fi

NAMESPACE="$1"
TLS_SECRET_NAME="$2"
TLS_BASE64_CRT="$3"
TLS_BASE64_KEY="$4"

if kubectl get secret $TLS_SECRET_NAME &> /dev/null; then
  echo "Secret $TLS_SECRET_NAME already exists."
else
  cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: $TLS_SECRET_NAME
  namespace: $NAMESPACE
type: kubernetes.io/tls
data:
  tls.crt: >-
    $TLS_BASE64_CRT
  tls.key: >-
    $TLS_BASE64_KEY
EOF
fi
