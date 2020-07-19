# ansible-sandbox

Ansible core concepts w/ GCP.

- [x] core concepts
- [ ] Create N instances on GCP 

<br>

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

