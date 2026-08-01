# Project scaffold

The collection uses a flat role namespace. Logical categories are represented
by prefixes such as `common_`, `service_`, `desktop_`, `app_`, `development_`,
`hardware_`, `networking_`, `security_`, and `jails_`.

## Roles

- `common_validation` — Validate supported FreeBSD targets and shared variables.
- `common_packages` — Manage common workstation packages and package repository settings.
- `common_users` — Manage workstation users, groups, home directories, and memberships.
- `common_sudo` — Configure sudo and administrative privileges.
- `common_fonts` — Install shared fonts and rebuild the system font cache.
- `common_filesystem` — Manage shared directories, permissions, and filesystem conventions.
- `common_shell` — Configure system and user shell defaults.
- `common_localization` — Configure locale, timezone, keyboard, and regional settings.
- `service_dbus` — Install and configure D-Bus.
- `service_seatd` — Install and configure seatd.
- `service_ntpsec` — Install and configure NTPsec.
- `service_ssh` — Install and configure OpenSSH services and client defaults.
- `service_moused` — Configure the FreeBSD console mouse service.
- `service_power` — Configure power management and related services.
- `desktop_xorg` — Install and configure the X.Org display stack.
- `desktop_wayland` — Install shared Wayland components and environment settings.
- `desktop_suckless` — Clone, finalize, build, and install dwm, dmenu, and st.
- `desktop_sway` — Install and configure the Sway desktop.
- `desktop_common` — Install desktop-wide utilities shared by all desktop profiles.
- `app_firefox` — Install and configure Firefox.
- `app_thunderbird` — Install and configure Thunderbird.
- `app_neovim` — Install and configure Neovim.
- `app_terminal_tools` — Install common terminal utilities.
- `app_file_manager` — Install and configure graphical and terminal file managers.
- `app_multimedia` — Install multimedia applications and codecs.
- `app_proton` — Install or integrate supported Proton applications and services.
- `development_base` — Install common compilers, build tools, and development utilities.
- `development_ansible` — Install and configure Ansible tooling.
- `development_python` — Install Python development tooling.
- `development_git` — Install and configure Git.
- `development_editors` — Install development editors and IDE support.
- `hardware_virtualbox` — Configure FreeBSD when running as a VirtualBox guest.
- `hardware_dell_latitude_5591` — Configure hardware-specific settings for the Dell Latitude 5591.
- `hardware_common_laptop` — Configure common laptop hardware features.
- `networking_base` — Configure common network services and client utilities.
- `networking_wifi` — Configure wireless networking.
- `networking_zeroconf` — Configure mDNS and ZeroConf discovery.
- `security_base` — Apply baseline workstation security settings.
- `security_hardening` — Apply optional FreeBSD workstation hardening.
- `jails_base` — Install and configure shared FreeBSD jail infrastructure.
- `jails_vnet` — Configure VNET jail networking.
- `validation_workstation` — Validate the resulting workstation configuration.

## Entry playbooks

- `local.yml` — default Suckless workstation
- `local-sway.yml` — Sway workstation
- Collection playbooks under `collections/ansible_collections/c9/freebsd_workstation/playbooks/`

Placeholder roles are safe no-op roles. They print a status message and report
no change until their real implementation replaces the placeholder task.
