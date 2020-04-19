# display-manager role

__NOTE__ This role is a prototype and is not ready to be used.

Installs a display manager.

## Role Variables

None.

## Example Playbook

```yaml
- hosts: all
  become: yes
  become_user: root
  roles:
   - role: desktops/display-manager
```
