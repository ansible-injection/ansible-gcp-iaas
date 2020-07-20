# ansible-gcp-iaas

Ansible boilerplate for GCP IaaS scenarios. We need **1 service-account** and **1 machine user!**

<br>

Generally, you need to do _provisioning_ as **localhost** using _ansible service account_. Creation service account manually is easier than using cli. Alsot, You should choose _static host_ management. Then, you can _configure_ machines using your _own GCP account_. Because Configuration requires ssh.

- [x] core concepts: Check `1.0.0-CORE` tag
- [x] Create N instances on GCP

## Strategy

- For the _continuous delivery_, CI pipeline calls Ansible playbooks for deployment. 
- Some intersections w/ Ansible's deployment and Build tool (gradle) which handles docker image creation automatically. But Ansible is still valid for build images (in may be some cases), and push it to image repositories etc.
- If you are using k8s, most parts of the _configuration_ and _deployment_ will be handled by k8s, too!

### Structure

General structure in Ansible projects.

- .gcp.env.yaml (env. variables)
- hosts (static inventory) or inventory.gcp.yaml (dynamic inventory). Click for [more](https://github.com/ansible-injection/ansible-gcp-iaas/wiki/Ansible-Inventory-Management-in-GCP)
- provision.yaml (infrastructure provisioning)
- configuration.yaml (infrastructure/application configuration i.e. Package installations, Move stages from dev to prod etc.)
- tuning.yaml (tuning configurations at linux or application level)
- deployment.yaml (application deployment i.e blue/green deployment etc.)

## Installation

- Install **Ansible** cli on your local w/ `brew install ansible`, then check `ansible --version`

#### Preperations for GCP

- Configure **gcloud cli** on your local. This will create `.ssh/google_compute_engine`.
- Create _service account_ manually as ansible and give `roles/admin` role, or Do [automatically](https://github.com/ansible-injection/ansible-gcp-iaas/wiki/Service-Account-Creation-in-GCP)

#### Integrating to GCP

- For provisioning, Run `ansible-playbook provision.yaml`
    - Edit `.gcp.env.yaml` file and service_account_file value
- Edit `hosts` file, manually. Use network Tags in GCP to draw the infrastructure architecture.
- For configuration, Run, `ansible-playbook configuration.yaml -i hosts` that creates `~/.ssh/google_compute_engine` file.
    - Edit `ansible.cfg` and change `remote_user` value


