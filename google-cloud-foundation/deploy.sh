#!/bin/bash

ORGANIZATION_ID=123456789123
PROJECT_ID=foundation-ondfisk
USER_EMAIL=ondfisk@ondfisk.dk
ROLES=("roles/billing.projectManager"
    "roles/billing.user"
    "roles/compute.xpnAdmin"
    "roles/config.agent"
    "roles/logging.configWriter"
    "roles/orgpolicy.policyAdmin"
    "roles/resourcemanager.folderIamAdmin"
    "roles/resourcemanager.folderCreator"
    "roles/resourcemanager.folderEditor"
    "roles/resourcemanager.projectIamAdmin"
    "roles/resourcemanager.projectCreator"
    "roles/resourcemanager.projectDeleter"
    "roles/serviceusage.serviceUsageConsumer"
    "roles/secretmanager.secretAccessor"
    "roles/iam.serviceAccountUser"
    "roles/storage.objectUser")
BILLING_ACCOUNT_ID=010101-010101-010101

gcloud auth login --no-launch-browser

gcloud config set project $PROJECT_ID

gcloud iam service-accounts create terraform-deployer --display-name "Terraform Deployer"

gcloud iam service-accounts add-iam-policy-binding terraform-deployer@$PROJECT_ID.iam.gserviceaccount.com --member="user:$USER_EMAIL" --role="roles/iam.serviceAccountTokenCreator"

for role in "${ROLES[@]}"; do
  gcloud organizations add-iam-policy-binding $ORGANIZATION_ID \
    --member="serviceAccount:terraform-deployer@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="$role"
done

gcloud billing accounts add-iam-policy-binding $BILLING_ACCOUNT_ID \
  --member="serviceAccount:terraform-deployer@$PROJECT_ID.iam.gserviceaccount.com" \
  --role="roles/billing.user"

gcloud auth application-default login --impersonate-service-account terraform-deployer@$PROJECT_ID.iam.gserviceaccount.com --no-launch-browser

terraform init
terraform plan
terraform apply
