#!/bin/bash

set -e

NAMESPACE=jenkins

kubectl create namespace $NAMESPACE || true

helm upgrade --install jenkins jenkins/jenkins \
  -n $NAMESPACE \
  -f helm/values.yaml \
  --set controller.JCasC.configScripts.main-config="$(cat jcasc/jenkins.yaml)"
