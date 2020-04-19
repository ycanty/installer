# microk8s role

Installs [microk8s](https://microk8s.io/).

Aliases (mk, md, mi) are created for microk8s.kubectl, microk8s.docker,
microk8s.istioctl, respectively.

The most widely used addons are enabled by default.  You can override
this with the role variable `microk8s_enable_addons`.  See below for
details.

It is safe to also install [docker](../docker/README.md).  The `microk8s.docker`
is sandboxed for exclusive use of microk8s.

The microk8s cluster is spawned on localhost using default kubernetes ports,
so the standalone `kubectl` and `helm` commands will find it by default if your
system doesn't have any config file in `~/.kube/config`.

However, if you've installed the standalone [kubectl role](../kubectl/README.md)
and you have configuration to access other clusters, you can easily add
the microk8s context configuration to your existing kube configs with
`microk8s.config`.  For example:

```bash
microk8s.config > ~/.kube/configs/microk8s.config
```

## Role Variables

See [defaults](defaults/main.yml) for role defaults for these variables.

### microk8s_enable_istio

When "yes", enables istio on the microk8s installation.

### microk8s_enable_addons

String of addons to enable.  Set to an empty string "" to not add any addons.
For istio, please use microk8s_enable_istio=yes instead, as it requires extra
configuration.

## Example Playbook

To install the latest version:

```yaml
- hosts: all
  become: yes
  become_user: root
  roles:
   - role: tools/microk8s
```
