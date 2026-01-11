# AI Context for Developer Environment VM Images Project

## Project Overview
This project provides a framework for creating and configuring developer environment virtual machines using Vagrant and Ansible. It separates VM creation (Vagrant) from configuration (Ansible) to allow flexible provisioning of "flavors" on top of base VMs.

## Directory Structure
- **`vagrant/`**: Contains Vagrant configurations for creating base VMs.
  - subdirectories (e.g., `bookworm-xfce`) represent specific VM types.
- **`ansible/`**: Contains Ansible assets for configuration.
  - **`roles/`**: Reusable roles (`base`, `devtools`, `vscode`, `xfce`).
  - **`inventory/`**: Inventory files (`hosts.yaml`).
  - **`*.yaml`**: Playbooks (e.g., `formal-methods-tools.yaml`).
- **`cli`**: Python script to manage playbook execution.
- **`commands/`**: Python implementation of CLI commands.

## Key Components

### 1. VM Creation (Vagrant)
To create a VM:
```bash
cd vagrant/<vm-type>
vagrant up
```
This spins up a base VM (e.g., Debian Bookworm).

### 2. VM Configuration (Ansible)
Ansible is used to provision the VM with tools.
- **Dependencies**: Managed via `uv` (includes `ansible`, `sh`, `typer`).
- **Inventory**: `ansible/inventory/hosts.yaml` must be configured with the target VM's IP.

### 3. CLI Wrapper (`./cli`)
A helper script to simplify running Ansible playbooks.
- **List Playbooks**: `./cli list`
- **Run Playbook**: `./cli run <playbook-name>` (e.g., `./cli run formal-methods-tools`)

## Development Environment
- **Python**: >=3.13
- **Tools**: `uv` for dependency management.
- **Core Libraries**: `ansible`, `sh`, `typer`.
