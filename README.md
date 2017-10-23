# Prometheus Ansible Role

Installs/configures Prometheus and some friends:
- prometheus
- alertmanager
- node_exporter
- blackbox_exporter
- consul_exporter
- mysqld_exporter
- elasticsearch_exporter (third-party)
- mongodb_exporter (third-party)
- rabbitmq_exporter (third-party)

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
