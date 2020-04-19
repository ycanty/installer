#!/bin/bash
# Run this file with sudo, from inside the wsl shell
set -e

check_ansible_version() {
    local version=$1

    ANSIBLE_CONFIG=./ansible.cfg ansible --version | grep "ansible ${version}" > /dev/null 2>&1

    return $?
}

install_ansible() {
    local version=$1

    add-apt-repository -y ppa:ansible/ansible
    apt-get update
    apt-get install --no-install-recommends -y ansible=${version}
}

KERNEL_VERSION=$(uname -r)

if [[ ( "${USER}" != "root" )  || ( ! "${KERNEL_VERSION}" =~ Microsoft ) ]]
then
    echo "Please run with 'sudo' in a WSL shell"
    exit 1
fi

ANSIBLE_VERSION=${1:-2.7.6}

check_ansible_version ${ANSIBLE_VERSION} || install_ansible ${ANSIBLE_VERSION}

sudo -u ${SUDO_USER} bash -c "ANSIBLE_CONFIG=./ansible.cfg ansible-playbook main.yml"
