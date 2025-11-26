#!/bin/bash
set -e

# Always run from repo root
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

echo "Applying Jenkins chart with JCasC from repo root: $REPO_ROOT"

helm upgrade --install jenkins jenkins/jenkins \
  -n jenkins \
  -f helm/values.yaml

echo "Restarting Jenkins pod..."
kubectl delete pod jenkins-0 -n jenkins --ignore-not-found
