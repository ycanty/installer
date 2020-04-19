# git role

Installs the latest version of git and gitk as apt packages,
so they get upgraded with the normal OS package management utilities.

Also installs a working `.gitconfig` file in the user's home directory.

## Role Variables

### user.name

user.name to use to setup the initial `.gitconfig` file.

### user.email

User email to use to setup the initial `.gitconfig` file.


## Example Playbook

To install the latest version:

```yaml
- hosts: all
  become: yes
  become_user: root
  roles:
   - role: tools/git
```
