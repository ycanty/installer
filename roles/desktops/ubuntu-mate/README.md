# ubuntu-mate role

Installs the [ubuntu MATE](https://ubuntu-mate.org/) desktop.

This is the complete MATE desktop distribution, with all its software
utilities installed.

## Role Variables

See [defaults](defaults/main.yml) for role defaults for these variables.

### autologin_user

The user account with which to automatically login to the desktop.


## Example Playbook

```yaml
- hosts: all
  become: yes
  become_user: root
  roles:
   - { role: desktops/xubuntu-core, autologin_user: "{{user.name}}" }

```
