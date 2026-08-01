# c9-freebsd-workstation-ansible

Collection-based FreeBSD workstation project designed to work with both
`ansible-playbook` and `ansible-pull`.

## Included roles

- `c9.freebsd_workstation.fonts`
- `c9.freebsd_workstation.desktop_suckless`

## What the project does

1. Installs shared system fonts.
2. Rebuilds the system font cache only when fonts change.
3. Clones or updates dwm, dmenu, st, and the flexipatch finalizer.
4. Removes and recreates each finalized source tree.
5. Runs the FreeBSD finalizer script.
6. Runs `gmake clean`, `gmake`, and `gmake install` in every final directory.

## Local execution

```sh
sudo ansible-playbook local.yml
```

## ansible-pull

**Core Repository and Execution Parameters**

  -U URL, --url=URL: Specify the repository URL to pull the playbook from.
  -C CHECKOUT, --checkout=CHECKOUT: Branch, tag, or commit to checkout (defaults to repo default).
  -m MODULE_NAME, --module-name=MODULE_NAME: VCS module used to fetch the repository (defaults to git).
  -d DEST, --dest=DEST: Directory path where the repository should be checked out.
  -f, --force: Run the playbook even if the repository update fails.
  -o, --only-if-changed: Run the playbook only if the repository has new updates.

**Inventory and Connection Parameters**

  -i PATH, --inventory=PATH: Path to the inventory file (defaults to /etc/ansible/hosts).
  -c CONNECTION, --connection=CONNECTION: Connection type to use (defaults to local).
  -u REMOTE_USER, --user=REMOTE_USER: Connect as this specific remote user.
  --private-key=PRIVATE_KEY_FILE: Use this file to authenticate the connection.

**Control and Behavior Parameters**

  -e EXTRA_VARS, --extra-vars=EXTRA_VARS: Set additional variables for the playbook using key-value pairs or quoted YAML/JSON.
  -t TAGS, --tags=TAGS: Run only tasks and plays tagged with specified values.
  --skip-tags=SKIP_TAGS: Skip specific tasks and plays carrying these tags.
  --purge: Delete the checkout folder after the playbook finishes running.
  -s SLEEP, --sleep=SLEEP: Wait a random number of seconds (between 0 and SLEEP) before starting to stagger requests.
  --check: Run in dry-run mode without making any actual changes to the system.

```sh
sudo /usr/local/bin/ansible-pull \
    --clean \
    --checkout "main" \
    --directory "/var/db/ansible-pull/c9-freebsd-workstation" \
    --inventory "/var/db/ansible-pull/c9-freebsd-workstation/inventory/hosts.yml" \
    --url "https://github.com/lirux9873/c9-freebsd-workstation-ansible_v2.git" \
    local.yml \
    "$@"
```

## Configuration

Edit `group_vars/all.yml` to change repositories, branches, fonts, paths, or
build arguments.

## Important

The final destination directories are removed and recreated on every run.
Do not place manual changes in `/usr/local/src/dwm-final`,
`/usr/local/src/dmenu-final`, or `/usr/local/src/st-final`.
