# java role

Installs Oracle Java 8.

Also sets up the proper environment variables in the user's `.profile`.

## Role Variables

### user.name

The user account in which to set the environment variables.


## Example Playbook

To install the latest version:

```yaml
- hosts: all
  become: yes
  become_user: root
  roles:
   - role: tools/java
```
