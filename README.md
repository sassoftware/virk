# SAS Viya Infrastructure Resource Kit (VIRK) [DEPRECATED]

## DEPRECATION NOTICE

`This github repository has been deprecated.  In the very near future, this repository will no longer be updated.`  

`A replacement repository is available.  Please visit https://github.com/sassoftware/viya-ark for SAS Viya 3.4 or later releases of SAS Viya.`

`Customers currently deploying SAS Viya 3.4 are recommended to begin using the new replacement repository immediately.`  

`Any issues related to SAS Viya Administration Resource Kit (SAS Viya-ARK) should be submitted against the new repository using https://github.com/sassoftware/viya-ark/issues.`

SAS VIRK provides interoperating tools and utilities to help SAS customers prepare for a SAS(R) Viya(R) deployment.

## License

Copyright (c) 2017-2018 by SAS Institute Inc., Cary, NC 27513 USA

Licensed under the Apache License, Version 2.0 (the "License"); 
you may not use this file except in compliance with the License. 
You may obtain a copy of the license at

   http://www.apache.org/licenses/LICENSE-2.0
   
The license is also included in this repository here:

   [LICENSE](LICENSE)

Unless required by applicable law or agreed to in writing, software 
distributed under the License is distributed on an "AS IS" BASIS, 
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
See the License for the specific language governing permissions and 
limitations under the License.

## Introduction to SAS VIRK
VIRK is a collection of resources to automate and streamline tasks that are required to prepare an environment for a SAS Viya deployment.
VIRK provides the following types of assistance:

  * Pre-deployment assessment and optional configuration
  * Post-deployment automation
  * Post-deployment utilitites
  * Infrastructure templates

## Prerequisites for SAS VIRK
Each item that is included in the resource kit will provide a document that describes its specific prerequisites and functionality.

As an example, a functioning [Ansible Controller](http://docs.ansible.com/ansible/latest/intro_installation.html) is required to run  the Ansible playbooks that are included in the Pre-installation Playbooks section. A list of the available playbooks is provided below in the [Index of tools](#index-of-tools) section.

# Index of Tools

* Pre-installation Playbooks

  * [Viya 3.2 Pre-Install Playbook](../viya-3.2/playbooks/pre-install-playbook)
  * [Viya 3.3 Pre-Install Playbook](../viya-3.3/playbooks/pre-install-playbook)
  * [Viya 3.4 Pre-Install Playbook](../viya-3.4/playbooks/pre-install-playbook)
* Home Directory Creator Playbook
  * [Viya 3.3 Home Directory Creator Playbook](../viya-3.3/playbooks/home-directory-creator)
  * [Viya 3.4 Home Directory Creator Playbook](../viya-3.4/playbooks/home-directory-creator)
* Utilities
  * [SAS DataServer Utility Script](../viya-3.4/utilities/postgres/viya)
  * [Viya Multi-Machine Services Utilities](../viya-3.4/playbooks/viya-mmsu)
