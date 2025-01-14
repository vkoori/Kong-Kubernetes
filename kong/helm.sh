if ! helm repo list | grep -q "kong"; then
  helm repo add kong https://charts.konghq.com
fi
# helm repo update
