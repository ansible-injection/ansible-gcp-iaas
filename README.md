# test-gcp-iaas-roles

Test boilerplate for Ansible role(s) for GCP IaaS scenarios. For more [detail](https://github.com/ansible-injection/test-gcp-iaas-roles/wiki)

## Requirements
 
- _ansible_ client
- _ansible.cfg_ file and enable _gcp_compute_ plugin
- service account and gcp account

### Structure

[Playbook based project structure](https://github.com/ansible-injection/test-gcp-iaas-roles/wiki/Ansible-playbook-project-structure) in Ansible projects.

If you are using *role based project structure*

```
- ansible.cfg
- hosts
- provision.yaml (which runs roles w/ your valid vars)
- inside `~/.ansible` folder
    - role1
    - role2
    - ..
```

## Installation

- Install **Ansible** cli on your local w/ `brew install ansible`, then check `ansible --version`

#### Preperations

- Configure **gcloud cli** on your local. This will create `.ssh/google_compute_engine`
- Create _service account_ manually as ansible and give `roles/admin` role, or Do [automatically](https://github.com/ansible-injection/ansible-gcp-iaas/wiki/Service-Account-Creation-in-GCP)
- Edit `ansible.cfg` and change `remote_user` value
- Edit `provision.yaml` file and change `vars.general.project` value
- Run `ansible-galaxy install -r requirements.yaml` to get related roles

#### Integrating to GCP

- For provisioning, Run `ansible-playbook provision.yaml`
- Edit `hosts` file, manually. Align network Tags in GCP and host groupping.
- For configuration, Run, `ansible-playbook configuration.yaml -i hosts`.

