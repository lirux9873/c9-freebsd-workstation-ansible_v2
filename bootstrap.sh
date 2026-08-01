#!/bin/sh

set -eu

REPOSITORY_URL="${REPOSITORY_URL:-https://github.com/lirux9873/c9-freebsd-workstation-ansible.git}"
REPOSITORY_BRANCH="${REPOSITORY_BRANCH:-main}"
WORK_DIRECTORY="${WORK_DIRECTORY:-/var/db/ansible-pull/c9-freebsd-workstation}"

if [ "$(uname -s)" != "FreeBSD" ]; then
    printf '%s\n' "ERROR: This command supports FreeBSD only." >&2
    exit 1
fi

if [ "$(id -u)" -ne 0 ]; then
    echo "Run this script as root." >&2
    exit 1
fi

# Update the system and install required packages
pkg update
pkg install -y py312-ansible-core git bash ca_root_nss

# Install the community.general collection if not already installed
if ! ansible-galaxy collection list community.general >/dev/null 2>&1; then
    ansible-galaxy collection install community.general
fi

# Run ansible-pull to apply the configuration
exec /usr/local/bin/ansible-pull \
    --clean \
    --checkout "${REPOSITORY_BRANCH}" \
    --directory "${WORK_DIRECTORY}" \
    --inventory "${WORK_DIRECTORY}/hosts" \
    --url "${REPOSITORY_URL}" \
    local.yml \
    "$@"