#!/bin/bash

clear
cluster_name=${1}

if [ -z ${cluster_name} ]; then
  echo 'ERROR: cluster name argument not defined, please pass the desired cluster name as an argument.'
  exit 1
else
  echo "Creating single-node cluster: ${cluster_name}"
  echo '------------------------------------------------------'
fi

cluster_exists=$(kind get clusters)
if [ "${cluster_exists}" == "${cluster_name}" ]; then
  echo 'Cluster exists! Cluster WILL NOT be created, skipping....'
  echo 'Cluster Deployed:'
  kind get clusters
else
  echo "Creating cluster ${cluster_name}"
  kind create cluster --name ${cluster_name}
  echo 'Cluster Deployed:'
  kind get clusters
fi
