# Prometheus Ansible Role

[![Build Status](https://travis-ci.org/bdclark/ansible-prometheus.svg?branch=master)](https://travis-ci.org/bdclark/ansible-prometheus)

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
This role has been tested with the following versions of Ansible and operating systems:
- Ansible 2.6, 2.7, 2.8
- Ubuntu 16.04, 18.04
- Centos 7.x
- Amazon Linux 2

Role Variables
--------------
See [defaults/main.yml](defaults/main.yml) for a list and description of
variables used in this role.


Example Playbook
----------------
See [test/playbooks](test/playbooks) for example usage.
