source .gcp.env
# you need to configure your gcp account firts to run below cmds!

# create
gcloud iam service-accounts create ${SERVICE_ACCOUNT_NAME} \
                                --display-name ${SERVICE_ACCOUNT_DISPLAY_NAME}

# give roles
gcloud projects add-iam-policy-binding ${PROJECT_ID} \
                    --role ${SERVICE_ACCOUNT_ROLE_NAME} \
                    --member serviceAccount:${SERVICE_ACCOUNT_EMAIL}

# download key
gcloud iam service-accounts keys create ~/.ssh/${SERVICE_ACCOUNT_KEY_FILE} \
                                    --iam-account ${SERVICE_ACCOUNT_EMAIL}

echo "check private key file"
ls ~/.ssh/*.json

# no need to activate service account for Ansible !
# activate
# gcloud auth activate-service-account --key-file=~/.ssh/${SERVICE_ACCOUNT_KEY_FILE}

# check
# gcloud compute zones list