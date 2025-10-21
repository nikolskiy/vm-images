# Developer Environment VM Images

This project provides a flexible framework for creating and configuring developer environment virtual machines using Vagrant and Ansible.

## Philosophy

The project is designed with a clear separation of concerns:

-   **VM Creation**: Handled by [Vagrant](https://www.vagrantup.com/). The `vagrant/` directory contains configurations to build base virtual machines.
-   **VM Configuration**: Handled by [Ansible](https://www.ansible.com/). The `ansible/` directory contains playbooks to provision the VMs with specific development tools and environments.

This separation allows you to apply Ansible playbooks to any existing machine (not just those created by this project's Vagrant files) or to create a single base VM and then provision multiple "flavors" from it using different playbooks.

## Table of Contents

- [Developer Environment VM Images](#developer-environment-vm-images)
  - [Philosophy](#philosophy)
  - [Table of Contents](#table-of-contents)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Initial Setup](#initial-setup)
  - [Usage](#usage)
    - [1. Create a Virtual Machine (with Vagrant)](#1-create-a-virtual-machine-with-vagrant)
    - [2. Configure the Virtual Machine (with Ansible)](#2-configure-the-virtual-machine-with-ansible)
      - [Inventory Configuration](#inventory-configuration)
      - [Running a Playbook](#running-a-playbook)
  - [Contributing](#contributing)
  - [License](#license)

## Getting Started

### Prerequisites

Before you begin, ensure you have the following tools installed on your host machine:

-   [Vagrant](https://www.vagrantup.com/downloads)
-   [uv](https://github.com/astral-sh/uv) (for Python environment management)
-   You don't need to install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) on your host machine. It will be installed via `uv`.

### Initial Setup

It is recommended to use a virtual environment for Python dependencies. This project is configured to use `uv`.

1.  **Create the virtual environment:**
    ```bash
    uv venv
    ```

2.  **Activate the virtual environment:**
    ```bash
    source .venv/bin/activate
    ```

3.  **Install Python dependencies (including Ansible):**
    ```bash
    uv sync
    ```

## Usage

The typical workflow involves creating a VM with Vagrant and then configuring it with Ansible.

### 1. Create a Virtual Machine (with Vagrant)

The `vagrant/` directory contains the configurations for building virtual machines. For detailed instructions on building a specific VM, please refer to the README inside that directory.

For example, to build the Debian Bookworm machine:
```bash
cd vagrant/bookworm-xfce
vagrant up
```
See the [`vagrant/README.md`](./vagrant/README.md) for more details.

### 2. Configure the Virtual Machine (with Ansible)

Once you have a running machine (either from Vagrant or another source), you can provision it using the Ansible playbooks.

#### Inventory Configuration

Before running a playbook, you need to tell Ansible which machine to connect to.

1.  **Copy the example inventory file:**
    ```bash
    cp ansible/inventory/hosts-example.yaml ansible/inventory/hosts.yaml
    ```

2.  **Update `ansible/inventory/hosts.yaml`** with the IP address or hostname of your target machine. If you are using the Vagrant machine, it's typically something like `192.168.56.2` (check the specific Vagrantfile).

#### Running a Playbook

A simple command-line interface (`./cli`) is provided to run the playbooks from the project root.

1.  **List available playbooks:**
    ```bash
    ./cli list
    ```

2.  **Apply a specific playbook:**
    ```bash
    ./cli run <playbook-name>
    ```

## Contributing

Contributions are welcome! Please feel free to submit a pull request.

## License

This project is licensed under the MIT License.

