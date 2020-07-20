# ansible-gcp-iaas

Ansible boilerplate for GCP IaaS scenarios. We need **1 service-account and 1 machine user!**


- [x] core concepts: Check `1.0.0-CORE` tag
- [x] Create N instances on GCP

## Strategy

- For the _continuous delivery_, CI pipeline calls Ansible playbooks for deployment. 
- Some intersections w/ Ansible's deployment and Build tool (gradle) which handles docker image creation automatically. But Ansible is still valid for build images (in may be some cases), and push it to image repositories etc.
- If you are using k8s, most parts of the _configuration_ and _deployment_ will be handled by k8s, too!

## Installation & Basic Configurations

- Install **Ansible** on your local or on a separate server. Run `brew install ansible`, then check `ansible --version`
- Then, Design _inventory_ file to access provisioned machines. Static or dynamic inventory is possible.
- Run, `ansible-playbook FILE_NAME.yaml -i hosts`

### Structure

- .gcp.env.yaml (env. variables)
- hosts (static inventory) or inventory.gcp.yaml (dynamic inventory)
- provision.yaml (infrastructure provisioning)
- configuration.yaml (infrastructure/application configuration i.e. Package installations, Move stages from dev to prod etc.)
- tuning.yaml (tuning configurations at linux or application level)
- deployment.yaml (application deployment i.e blue/green deployment etc.)


## Integrating to GCP

- Configure _gcloud cli_ on your local w/ your normal account. This will create `.ssh/google_compute_engine`.
    - `gcloud auth list` to see active account, if you need
- If you do not want to _create service account manually_, then 
    - Edit `.gcp/env` file, and 
    - Run `./create-service-account.sh` to create a service account and download the private key to `~/.ssh/` !

- If you already have a service account's private key (.json file), 
    - Just copy it to `~/.ssh/` folder. Then,
    - Edit `.gcp.env.yaml` file for json file name!

<hr>

- To do provisioning, Run `ansible-playbook gprovision.yaml`

<hr>

Do configuration, either _static_ or _dynamic_
- Static inventory
    - Edit `hosts` file, manually. Use network Tags in GCP to draw the arhitecture.
    - Run, `ansible-playbook configuration.yaml -i hosts`
        - This still needs `ansible.cfg` and remote_user values.
- Dynamic inventory
    - To see the inventory, Run `ansible-inventory -i inventory.gcp.yaml --list --export  --output output `
    - Run `ansible-playbook configuration.yaml -i inventory.gcp.yaml` as parameter to define inventory where necessary.
        - This still needs `ansible.cfg` and remote_user values.
