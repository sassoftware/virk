# Viya Services Manager Playbook

This playbook is designed to leverage Ansible and the deployment's inventory file in order to orchestrate graceful and efficient start/stop/restart sequences for the Viya Services, regardless of deployment topology or number of servers.

## DISCLAIMER
This Ansible Playbook is provided as-is, without warranty of any kind, either express or implied, including, but not limited to, the implied warranties of merchantability, fitness for a particular purpose, or non-infringement.

SAS Institute shall not be liable whatsoever for any damages arising out of the use of this documentation and code, including any direct, indirect, or consequential damages.

SAS Institute reserves the right to alter or abandon use of this documentation and code at any time.  In addition, SAS Institute will provide no support for the materials
 contained herein.

## Usage
1. Copy/Symlink all the viya.services.* files into your "sas_viya_playbook" folder
2. Ensure that the "inventory" line in the ansible.cfg file is pointing to the desired inventory file. (the one that was used to deploy)
3. To see a list of all tasks and tags, execute:
```
ansible-playbook viya.services.restart.yml --list-tasks
```
4. To confirm that your services are started, without trying to start them if they are not, execute:
```
ansible-playbook viya.services.start.yml --check
```
5. To stop all the services gracefully, execute:
```
ansible-playbook viya.services.stop.yml
```
6. To start all the services gracefully, execute:
```
ansible-playbook viya.services.start.yml
```

## Requirements.
This playbook works best with Ansible 2.4. It is compatible with Ansible 2.3. It has not yet been tested with Ansible 2.5.


## Fine Grained control
Various variables are available in the viya.services.vars.yml file, for a finer control.

## What if I want to use something else than Ansible for this.
If that is the case, you will have to read the content of this playbook and re-write it in your preferred orchestration tool.

## Special Parameters
### De-registering of microservices out of Consul.
It is sometimes required, after a sudden shutdown, to de-register stale microservices definitions out of the SAS Configuration Server (Consul).
If you need to, you can run the following sequence to perform a full restart:

```
# first, stop everything
ansible-playbook viya.services.stop.yml --tags consul
# Ensure at least Consul is up
ansible-playbook viya.services.start.yml --tags consul
# deregister everything
ansible-playbook viya.services.stop.yml --tags deregisterms -e deregister_services_in_consul=true
# start everything else
ansible-playbook viya.services.start.yml
```
