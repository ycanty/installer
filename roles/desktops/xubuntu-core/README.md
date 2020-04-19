# xubuntu-core role

Installs the [core variant](https://xubuntu.org/news/introducing-xubuntu-core/) of the
[Xubuntu XFCE desktop](https://xubuntu.org/) desktop.

This core variant contains a minimal set of utilities, making this desktop fast and lean.

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
