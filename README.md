# SAS Viya Infrastructure Resource Kit (VIRK)

SAS VIRK provides interoperating tools and utilities to help SAS customers prepare for a SAS(R) Viya(R) deployment.

## License

Copyright (c) 2017-2018 by SAS Institute Inc., Cary, NC 27513 USA

Licensed under the Apache License, Version 2.0 (the "License"); 
you may not use this file except in compliance with the License. 
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0
   
The license is also included in this repository here:

   [LICENSE](LICENSE)

Unless required by applicable law or agreed to in writing, software 
distributed under the License is distributed on an "AS IS" BASIS, 
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
See the License for the specific language governing permissions and 
limitations under the License.

## Introduction
VIRK is a collection of resources to automate and streamline tasks that are required to prepare an environment for a SAS Viya deployment.

VIRK provides the following types of assistance:

  * Pre-deployment assessment and optional configuration
  * Post-deployment automation
  * Post-deployment utilitites
  * Infrastructure templates

## Prerequisites for VIRK
Each item that is included in the resource kit provides a document that describes its specific prerequisites and functionality.

As an example, a functioning [Ansible Controller](http://docs.ansible.com/ansible/latest/intro_installation.html) is required to run  the Ansible playbooks that are included in the Pre-installation Playbooks section. A list of the available playbooks is provided below in the [Pre-installation](playbooks/pre-install-playbook) Playbook section.

## Support
SAS Technical Support does not provide support for the contents of this resource kit. However, you are welcome to submit issues and pull requests in GitHub.

# Index of tools

* [Pre-installation Playbook](playbooks/pre-install-playbook)
* [Home Directory Creator Playbook](playbooks/home-directory-createor)
* [SAS Data Server Utility Script](utilities/postgres/viya)
* [Service Management Playbook](playbooks/service-management)
