# SAS Viya Infrastructure Resource Kit (VIRK) - Viya Multi-Machine Services Utilties Playbooks

## Introduction
* This repository contains a set of playbooks to start/stop the SAS Viya Services gracefully over 1-n number of systems identified in the inventory.ini file

## Requirements for running the viya-mmsu playbooks
* Have a successful deployment for 1-n machines
  - That means all services are in up status after deployment
  - See below for how to list Viya services status
* Run from the same ansible controller with Viya playbooks in place
* Multi-tenant is not supported
* Make sure sas-viya-all-services is disabled from system reboot

## Running the scripts
To list all Viya services status and Viya urls, execute:
```
ansible-playbook virk/playbooks/viya-mmsu/viya-services-status.yml
```
To disable sas-viya-all-services from system reboot, execute:
```
ansible-playbook virk/playbooks/viya-mmsu/viya-services-disable.yml
```
To stop all the services gracefully, execute:
```
ansible-playbook virk/playbooks/viya-mmsu/viya-services-stop.yml
```
To start all the services gracefully, execute:
```
ansible-playbook virk/playbooks/viya-mmsu/viya-services-start.yml
```
To restart all the services gracefully, execute:
```
ansible-playbook virk/playbooks/viya-mmsu/viya-services-restart.yml
```
