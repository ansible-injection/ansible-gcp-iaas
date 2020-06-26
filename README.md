# ansible-sandbox

Ansible w/ GCP. We need **1 service-account and 1 machine user!**


- [x] Create 1 instance on GCP
- [ ] Create N instances on GCP w/
    - 1 static IP assigned each
    - 1 boot-disk attached
    - N data-disks attached 
    - N packages-installations
    - 1 user creation

<br>

- For the _continuous delivery_, CI pipeline call Ansible playbooks for deployment. 
- Some intersections w/ Ansible's deployment and Build tool (gradle) which handles image creation automatically. But Ansible is still valid for build images (in may be some cases), and push it to image repositories etc.
- If you are using k8s, most parts of the _configuration_ and _deployment_ will be handled by k8s, too!

## Structure

- .gcp.env.yaml (env. variables)
- hosts (static inventory)
- inventory.gcp.yaml (dynamic inventory)
- provision.yaml (infrastructure provisioning)
- configuration.yaml (infrastructure/application configuration i.e. Package installations, Move stages from dev/test/ to prod etc.)
- deployment.yaml (application deployment i.e blue/green deployment etc.)


## Installation & Basic Configurations

Install **Ansible** on your local or a separate server. Use inventory file from cmd line! 

- Run `brew install ansible`, then check `ansible --version`

## Integrating to GCP

- Configure _gcloud cli_ on your local w/ your normal account. This will create `.ssh/google_compute_engine` files
    - `gcloud auth list` to see active account, if you need
- If you do not want to _create service account manually_, then 
    - Edit `.gcp/env` file, and 
    - Run `./create-service-account.sh` to create a service account and to download private key to `~/.ssh/` !

<hr> 

If you already have a service account's private key (.json file), 
- Just copy it to `~/.ssh/` folder. Then,
- Check `.yaml` files for json file name!

<hr>

Do provisioning,
- `cd gcp`, then
- Run `ansible-playbook gcp/provision.yaml`

<hr>

Do configuration, either _static_ or _dynamic_
- Static inventory
    - Edit `hosts` file, manually. Use network Tags in GCP to draw the arhitecture.
    - Run, `ansible-playbook configuration.yaml -i hosts`
        - This still needs `ansible.cfg` and remote_user values.
- Dynamic inventory
    - `ansible-inventory -i inventory.gcp.yaml --list --export  --output .tmp ` to see the inventory.
    - Run `ansible-playbook configuration.yaml -i inventory.gcp.yaml` as parameter to define inventory where necessary.
        - This still needs `ansible.cfg` and remote_user values.

### Notes about roles

- `ansible-galaxy role init --init-path . ROLE_NAME`