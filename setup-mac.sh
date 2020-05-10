#!/bin/bash
# Run this file with sudo, from a bash shell

SCRIPTDIR=$(dirname $([[ $0 = /* ]] && echo "$0" || echo "$PWD/${0#./}"))

check_homebrew() {
    which brew > /dev/null 2>&1

    return $?
}

install_homebrew() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

check_ansible_version() {
    local version=$1

    (ANSIBLE_CONFIG=./ansible.cfg ansible --version | head -1 | grep "ansible ${version}") > /dev/null 2>&1

    return $?
}

install_ansible() {
    local version=$1

    brew install ansible
}

ANSIBLE_VERSION=${1:-*}

check_homebrew || install_homebrew
check_ansible_version "${ANSIBLE_VERSION}" || install_ansible "${ANSIBLE_VERSION}"

ANSIBLE_CONFIG=${SCRIPTDIR}/ansible.cfg ansible-playbook -K main.yml
