# SAS Viya Infrastructure Resource Kit (VIRK) - Service Management Playbooks

## Introduction
* This repository contains a set of playbooks to start/stop the SAS Viya Services gracefully over 1-n number of systems identified in the inventory.ini file

## Requirements for running the service-management playbooks
* Have a successful deployment for 1-n machines
  - That means all services are in up status after deployment
  - See below for how to list Viya services status
* Run from the same ansible controller with Viya playbooks in place
* Support Multi-tenant deployment
* Make sure sas-viya-all-services is disabled from system reboot

## Running the scripts
To list all Viya services status and Viya urls, execute:
```
ansible-playbook virk/playbooks/service-management/viya-services-status.yml
```
To disable sas-viya-all-services from system reboot, execute:
```
ansible-playbook virk/playbooks/service-management/viya-services-disable.yml
```
To stop all the services gracefully, execute:
```
ansible-playbook virk/playbooks/service-management/viya-services-stop.yml
```
To start all the services gracefully, execute:
```
ansible-playbook virk/playbooks/service-management/viya-services-start.yml
```
To restart all the services gracefully, execute:
```
ansible-playbook virk/playbooks/service-management/viya-services-restart.yml
```

## Tips
* When running playbook viya-services-stop.yml and seeing sas stray processes:
```
    "msg": [
        "Please examine the following stray process(es)",
        "If enable_stray_cleanup=true, it will be cleaned up automatically",
        "This playbook can be rerun to clean up the child procsses",
        [
          ...
        ]
    ]
```
  If the processes listed are ok to be cleaned up, user may issue command as below:
```
    ansible-playbook virk/playbooks/service-management/viya-services-stop.yml -e "enable_stray_cleanup=true"
```
  or modify viya-services-vars.yml file as following then rerun the playbook.
```
    enable_stray_cleanup: true 
```

## Support
While SAS Tech Support will not provide support for the content of VIRK, issues and/or pull requests in GitHub are welcome.
