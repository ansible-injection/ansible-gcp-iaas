# ansible-sandbox

Ansible w/ GCP 


## Installation & Basic Configurations

Install **Ansible** on your local or a separate server. Use inventory file from cmd line! 


- Run `brew install ansible `, then check `ansible --version`


## to configure for GCP

- Configure _gcloud cli_ on your local w/ your normal account. This will create `.ssh/google_compute_engine` files
    - `gcloud auth list` to see active account, if you need
- If you do not want to _create service account manually_, then 
    - Edit `.gcp/env` file, and 
    - Run `./create-service-account.sh` to create a service account and to download private key to `~/.ssh/` !
<br> 

If you have already a service account's private key (.json file), 
    - Just copy it to `~/.ssh/` folder. Then,
    - Check `.yaml` files for json file name!
- Run `ansible-playbook gcp-playbooks/create-elastic-IP-address.yaml`