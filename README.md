# Prometheus Ansible Role

Installs/configures Prometheus and friends:
- prometheus
- alertmanager
- node_exporter
- blackbox_exporter
- consul_exporter


Requirements
------------
- Tested on the following platforms:
  * Ubuntu 14.04
  * Ubuntu 16.04
  * Centos 7.3
- Ansible 2.3+


Role Variables
--------------
See [defaults/main.yml](defaults/main.yml) for a list and description of
variables used in this role.


Example Playbook
----------------
See [test/playbooks](test/playbooks) for example usage.

TODO: Add additional usage docs and examples.
