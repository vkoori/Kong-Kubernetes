Simple automation for deploying Kong on Kubernetes

**Check helm with following command:**

```shell
helm template kong kong/ingress -n kong --values values.yaml > rendered.yaml
```

**See**

1. https://docs.konghq.com/kubernetes-ingress-controller/latest/get-started/
2. https://docs.konghq.com/kubernetes-ingress-controller/latest/guides/services/http/
3. https://docs.konghq.com/kubernetes-ingress-controller/latest/plugins/custom/
4. https://docs.konghq.com/kubernetes-ingress-controller/latest/guides/services/tls/
5. https://gateway-api.sigs.k8s.io/reference/spec/#gateway.networking.k8s.io%2fv1.Gateway
6. https://docs.konghq.com/kubernetes-ingress-controller/latest/plugins/rate-limiting/
7. https://docs.konghq.com/kubernetes-ingress-controller/latest/guides/services/https-redirect/
8. https://docs.konghq.com/gateway/latest/how-kong-works/load-balancing/
9. https://github.com/Kong/charts/blob/main/charts/kong/values.yaml