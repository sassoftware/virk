# SAS Viya Infrastructure Resource Kit (VIRK) - Pre-Install Playbook

## Introduction
* This playbook verifies and possibly performs many of the pre-requisites for a generic Viya deployment.
* This playbook is for Viya 3.3

## Pre-requisites for running the pre-installation playbook
Before running this script you will need to:
* Install ansible. Version 2.3.2 or above is recommended for deployment.
* Make sure the user has sudo prvilileges
* Be aware that the scripts makes modifications to the system when not run with the --check option.
* The base inventory file that we've provided contains only localhost and will only run on the machine on which it was installed. To run the playbook against multiple machines you can update the inventory file to include additional hosts. See [Ansible Documentation](http://docs.ansible.com/ansible/latest/intro_inventory.html) for how-to.

## Running the script
To run the script, execute on the command line:
  ```
  ansible-playbook viya_pre_install_playbook.yml -i pre-install.inventory.ini
  ```

## Useful optional arguments
* ```--check```: Executes a "dry run" of the playbook. Runs the playbook without making changes to the system. Any module instrumented to support ‘check mode’  will report what changes they would have made rather than making them.
* ```-v through -vvvv```: Allows you to increase the verbosity of the script output; -vvvv enables connection debugging.
* ```-i <host-inventory-file>```: Allows use of a different host inventory file instead of the default /etc/ansible/host file.
* ```--tags <tag-name>```: Runs only task(s) with specific tag(s)
* ```--skip-tags <tag-name>```: Skip task(s) with specific tag(s)
* ```--list-tasks```: Display all tags in a playbook

# Index of tags for individual requirement checks within the playbook
To see a list of tasks you can run:
  ```
  ansible-playbook viya_pre_install_playbook.yml -i pre-install.inventory.ini --list-tasks
  ```
Example running only a specific check or configuration:
  ```
  ansible-playbook viya_pre_install_playbook.yml -i pre-install.inventory.ini --tags memory_check
  ```
