#!/bin/bash

set -e

clear
echo 'Setting up Kubernetes dashboard'
echo '--------------------------------'

echo 'Retrieve and install Kubernetes dashboard into cluster....'
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-rc6/aio/deploy/recommended.yaml
kubectl get all -n kubernetes-dashboard

echo 'Create new ServiceAccount....'
kubectl apply -f - <<EOF
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
EOF

echo 'Create ClusterRoleBinding for the ServiceAccount....'
# Create a ClusterRoleBinding for the ServiceAccount
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOF

token=$(kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}'))
url='http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/'

echo ''
echo "$token"
echo "URL: $url"
echo 'SUCCESS: dashboard has been set up, please use the URL and token (above) to login:'
echo ''
kubectl proxy