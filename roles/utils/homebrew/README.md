# homebrew

A generic utility role that installs homebrew formulas and casks for tools that
don't have a dedicated role.

## Role Variables

### homebrew_formulas

List of formulas to install

### homebrew_casks

List of casks to install

## Example Playbook

```yaml
- hosts: all
    - role: utils/homebrew
      homebrew_formulas:
        - terraform
        - terraform_landscape
        - awscli
      homebrew_casks:
        - intellij-idea
        - powershell     
```
