#!/bin/bash

set -aueo pipefail

# shellcheck disable=SC1091
source .env

echo "Apply backpressure policy for the bookstore-v2 service"
kubectl apply -f - <<EOF
apiVersion: policy.openservicemesh.io/v1alpha1
kind: Backpressure

metadata:
  name: max-connections-bookstore-v2
  namespace: "${BOOKSTORE_NAMESPACE}"

  labels:
    app: bookstore-v2

spec:
  maxConnections: 10
EOF
