apache
=========

Installs and configures apache.

[![CI](https://github.com/Rheinwerk/ansible-role-apache/actions/workflows/ci.yml/badge.svg)](https://github.com/Rheinwerk/ansible-role-apache/actions/workflows/ci.yml)

Requirements
------------

None.

Role Variables
--------------

`_apache` configures the whole role; cf. below or `defaults/main.yml`.

Dependencies
------------

None.

Example Playbook
----------------

```
---
- hosts: localhost
  connection: local
  become: yes
  vars:
    RW_APT_CACHE_UPDATE: yes
    APACHE:
      use_default_config: False
      listen:
        - { ip: localhost, port: 80 }
        - { ip: localhost, port: 443, ssl: True }
      modules:
        disable: []
        enable:
          - rewrite
      sites:
        - name: www.example.com
          enabled: True
          vhost: localhost
          port: 80
          document_root: /home/www
          server_admin: info@example.com
          extra: |+
            <Directory "/home/www">
                AllowOverride All
                Require all granted
            </Directory>
  pre_tasks:
    - name: Create document_root
      file: path=/home/www state=directory
  roles:
    - { role: ansible-role-apache, tags: ['apache'], _apache: "{{ APACHE }}" }

```

License
-------

See LICENSE file.

Author Information
------------------

Initially created by Lukas Pustina [@drivebytesting](https://twitter.com/drivebytesting) as member of the [Rheinwerk](https://github.com/Rheinwerk) project.

