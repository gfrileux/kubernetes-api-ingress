# !/bin/bash
set -e
set -x

echo "Building and deploying for ${CIRCLE_BRANCH} branch"

# Store service account
echo $GCLOUD_SERVICE_KEY > ${HOME}/gcloud-service-key.json

# Initialize gcloud CLI
gcloud auth activate-service-account --key-file ${HOME}/gcloud-service-key.json
# set default params
gcloud --quiet config set project $GOOGLE_PROJECT_ID
gcloud --quiet config set compute/zone $GOOGLE_COMPUTE_ZONE
# Activate cluster for remote access
gcloud --quiet container clusters get-credentials user-backend-cluster

# update the ingress
kubectl apply --validate=true -f kubernetes/

echo " Successfully deployed"