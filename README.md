# SAS Viya Infrastructure Resource Kit (VIRK)

Tools and utilities to help SAS customers with SAS Viya readiness.

## License

Copyright (c) 2017-2018 by SAS Institute Inc., Cary, NC 27513 USA

Licensed under the Apache License, Version 2.0 (the "License"); 
you may not use this file except in compliance with the License. 
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0
   
And is also included in this repository here

   [LICENSE](LICENSE)

Unless required by applicable law or agreed to in writing, software 
distributed under the License is distributed on an "AS IS" BASIS, 
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
See the License for the specific language governing permissions and 
limitations under the License.

## Introduction
* This collection of tools aims at automating and streamlining various aspects surrounding a Viya deployment.
* These include:

  * Pre-deployment assessment and/or configuration
  * Post-deployment automation
  * Infrastructure templates

## Pre-requisites for VIRK
Each item included here in the resource kit will detail its specific pre-requisite and functionality.

As an example, a functioning [Ansible Controller](http://docs.ansible.com/ansible/latest/intro_installation.html) is required for the Ansible playbooks contained in [Pre-Installation](playbooks/pre-install-playbook) playbook section.

## Support
While SAS Tech Support will not provide support for the content of this resource kit, issues and/or pull requests in GitHub are welcome.

# Index of tools

* [Viya Pre-Install Playbook](playbooks/pre-install-playbook)
* [Viya Home Directory Creator Playbook](playbooks/home-directory-createor)
* [SAS DataServer Utility Script](utilities/postgres/viya)
* [Service Management Playbook](playbooks/service-management)
