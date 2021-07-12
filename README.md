andrewrothstein.tflint
=========
![Build Status](https://github.com/andrewrothstein/ansible-tflint/actions/workflows/build.yml/badge.svg)

Installs [tflint](https://github.com/terraform-linters/tflint).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.tflint
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
