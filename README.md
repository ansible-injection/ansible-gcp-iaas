# ansible-sandbox




## Installation & Basic Configurations

Install **Ansible** on your local or a separate server. Use inventory file from cmd line! 


- Run `brew install ansible `, then check `ansible --version`


## to configure for GCP

- Configure _gcloud cli_ on your local w/ your normal account. This will create `.ssh/google_compute_engine` files
    - `gcloud auth list` to see active account, if you need
- Edit `.gcp/env` file, then 
    - Run `./create-service-account.sh` to create a service account and to download private key
    - Run `./activate-service-account.sh` to activate and test service account