# Installer

Cross-platform software installer based on ansible roles.

It started life as an ansible provisioner for Ubuntu vagrant boxes, to setup all the tools
I used for software development on these boxes.

Then I moved to Mac as my main laptop for development, so I extended each role to
suport installation on Macs (mostly delegating to Homebrew).

Nowadays I use it to setup all the software I use on my Macs at home.

I find these roles super useful for my personal use, and I offer them here with
no warranties or support, in case they can benefit someone else.  Documentation
is minimal.  As of this writing I use it regularly om my Mac, so `setup-mac.sh` works fine.
I haven't recently used nor maintained the Ubuntu or WSL tasks.

# Usage

In the following text, knowledge of `ansible` is assumed.

For setting up a mac, edit [main.yml](main.yml) and list the tools you want to use.
There's one ansible role per tool.  Some are configurable through variables.

Configuration variables for a tool by convention start with the name of the ansible role for
that tool.  Look in each role for what's available.

Then run [./setup-mac.sh](setup-mac.sh) and enter the password of an admin account.


# Design

The general idea is simply to have one ansible role per tool, or per aspect of
the target system to configure, such as which shell to use by default, or which
desktop environment to install on the Ubuntu VM.  If a tool depends on another tool,
then these are simply setup as role dependencies.  This setup allows to keep the main
playbook simple: you simply list what you want to install and any tool dependencies will
be added automatically.

The role structure follows the Ansible layout recommendations.  For each role,
the `main.yml` just detects the target OS and includes the corresponding `yml`
file for that target.  To avoid clashes, all variables for a role start with
the name of that role.

# Future work

## WSL experiment

`setup-wsl.sh` was an experiment I made to configure a Windows Subsystem for Linux (WSL)
instance of Ubuntu.  I no longer have access to a Windows machine, so that experiment
is put on ice for the time being...

## Vagrant ubuntu box provisioning

Back when I was regularly using the roles to configure a vagrant Ubuntu development box, I
didn't want users to require knowledge of `Vagrantfile` configuration.  I won't
go in the details here, but suffice it to say the Vagrantfile became very complex over time.
In that previous design, the roles in this repo were being executed from the host
laptop using ansible provisioning in the Vagrantfile to provision the Ubuntu box.

I decided to zap all this and go back to basics: this framework would just provide the
ansible roles, and no longer be coupled with vagrant.  My intent is to eventually write a
`setup-ubuntu.sh` script that will just run ansible on the current ubuntu host.

I created the current [Vagrantfile](Vagrantfile) just as a means to create a test
environment in which to test all roles when executed through the future `setup-ubuntu.sh`
script.

# Contribution

If you feel like contributing new roles or fixing existing ones, that would be
awesome!  Simply open a PR.  Note that I don't have lots of time on my hand
these days to work on this, so apologies in advance if I don't answer promptly.
