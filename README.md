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

```sh
sudo ansible-pull \
  -U https://github.com/lirux9873/c9-freebsd-workstation-ansible.git \
  -C main \
  -i localhost, \
  local.yml
```

## Configuration

Edit `group_vars/all.yml` to change repositories, branches, fonts, paths, or
build arguments.

## Important

The final destination directories are removed and recreated on every run.
Do not place manual changes in `/usr/local/src/dwm-final`,
`/usr/local/src/dmenu-final`, or `/usr/local/src/st-final`.
