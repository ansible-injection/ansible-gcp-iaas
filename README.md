# ansible-sandbox

Ansible w/ GCP & service account

- [x] Create a static IP on GCP
- [x] Create 1 instance on GCP
- [ ] Create N instances on GCP w/
    - 1 static IP assigned each, 
    - 1 boot-disk attached
    - N data-disks attached, and 
    - N packages-installations
    - 1 user creation

## Structure

- inventory
    - variables.yaml
    - hosts
- provision.yaml
- configuration.yaml
- roles
    - ....

## Installation & Basic Configurations

Install **Ansible** on your local or a separate server. Use inventory file from cmd line! 


- Run `brew install ansible`, then check `ansible --version`


## Integrating to GCP

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


### Notes about roles

- `ansible-galaxy role init --init-path . ROLE_NAME`