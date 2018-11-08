# SAS Viya Infrastructure Resource Kit (VIRK) - Home Directory Creator Playbook

## Introduction
This playbook was created to facilitate the implementation of Home directory auto-creation in SAS environments.

It was inspired by [this post from Paul Homes](https://platformadmin.com/blogs/paul/2017/04/sas-user-linux-home-dir-auto-creation/). (Read the post to have more background information).

This playbook will modify the various sasauth files so they call a script that triggers the creation of a user's home directory. This should work for both SAS 9.X and Viya environments.

## Before running this script you will need to:

* Install Ansible.
  * Version 2.3.2 is recommended for deployment.
* Be aware that the scripts makes modifications to the system when not run with the --check option.
* To run the playbook against multiple machines you can update the inventory file to include additional hosts.
  * See Ansible Documentation for how-to.
  * this playbook will execure by default on all machines in the sas-all host group
* You should not use a softlink for sasauth in /etc/pam.d either
* review the list "sasauth_locations" in the vars section, to make sure it covers the auth files you need.

## Running the script

To run the script, execute :
```
ansible-playbook home-directory-creator.yml -i <your.inventory.ini>
```
* --check: Executes a "dry run" of the playbook. Runs the playbook without making changes to the system. Any module instrumented to support ‘check mode’ will report what changes they would have made rather than making them.
* -v through -vvvv: Allows you to increase the verbosity of the script output; -vvvv enables connection debugging.
* -i <host-inventory-file>: Allows use of a different host inventory file instead of the default /etc/ansible/host file.
* --tags <tag-name>: Runs only task(s) with specific tag(s)
* --skip-tags <tag-name>: Skip task(s) with specific tag(s)
* --list-tasks: Display all tags in a playbook

To see a list of tasks you can run:
```
ansible-playbook home-directory-creator.yml -i inventory --list-tasks
```
These specific tags run the code that perform the home directory configuration checks and changes:
* service
* script
* authfilemodif
