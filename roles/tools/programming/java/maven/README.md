# maven role

Installs both maven and ant as APT packages, so they get upgraded with the standard OS
package management utilities.

Optionally installs a maven `settings.xml` file in `/home/{{user.name}}/.m2`.

Finally, sets some environment variables in `/home/{{user.name}}/.profile`.


## Role Variables

See [defaults](defaults/main.yml) for the role defaults of these variables.

### user.name

The user account name to configure for using maven (setting PATH and the maven settings file)

### maven_settings_url

URL of a maven settings file to download and install in `/home/{{user.name}}/.m2`


## Example Playbook

To install the latest version:

```yaml
- hosts: all
  become: yes
  become_user: root
  roles:
   - role: tools/maven
```

To install the latest version and install a settings file in the user's home:

```yaml
- hosts: all
  become: yes
  become_user: root
  roles:
   - { role: tools/maven , maven_settings_url: "https://localhost/settings.xml" }
```
