# SIPp role

Installs SIPp, a free Open Source test tool / traffic generator for the SIP protocol
It is installed as an apt package (sip-tester), so it gets upgraded using the standard OS package management utilities.
http://sipp.sourceforge.net/

## Role Variables

None.

## Example Playbook

To install the latest version:

```yaml
- hosts: all
  become: yes
  become_user: root
  roles:
   - role: tools/sipp
```
