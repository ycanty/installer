# vagrant role

Installs [Vagrant](https://vagrantup.com/).  If this role is used on WSL,
sets up the WSL vagrant to talk to the Windows VirtualBox.

## Role Variables

See [defaults](defaults/main.yml) for role defaults for these variables.

### vagrant_version

Version of vagrant to install.  If installing on WSL, the version must
match the version of vagrant installed on Windows.

### vagrant_vbox_install_path

Path to the directory where VBoxManage is installed.
Needed for WSL only.

## Example Playbook

To install the latest version:

```yaml
- hosts: all
  become: yes
  become_user: root
  roles:
   - role: tools/vagrant
```
