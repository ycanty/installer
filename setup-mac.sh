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

is_encrypted() {
    local file="$1"

    cat "${file}" | head -1 | grep "ANSIBLE_VAULT;" > /dev/null 2>&1
}


ANSIBLE_VERSION=${1:-*}

if [[ ! -f setup.yaml ]]
then
    echo
    echo "Please copy setup.yaml.template to setup.yaml,"
    echo "fill in the user-specific configuration values"
    echo "and run this script again."
    echo
    exit 1
fi

SETUP_FILE="${SCRIPTDIR}/setup.yaml"
VAULT_OPTS=""

check_homebrew || install_homebrew
check_ansible_version "${ANSIBLE_VERSION}" || install_ansible "${ANSIBLE_VERSION}"

is_encrypted "${SETUP_FILE}" && VAULT_OPTS="--vault-id @prompt"

ANSIBLE_CONFIG=${SCRIPTDIR}/ansible.cfg ansible-playbook --extra-vars "@${SETUP_FILE}" ${VAULT_OPTS} -K main.yml
