
source .gcp.env

# activate
gcloud auth activate-service-account --key-file=gcp-playbooks/${SERVICE_ACCOUNT_KEY_FILE}

# check
gcloud compute zones list


