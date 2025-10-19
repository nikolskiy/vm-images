# Developer Environment VM Images

This project provides a set of Ansible playbooks to configure developer environments for various programming languages and tools.

## Table of Contents

- [Developer Environment VM Images](#developer-environment-vm-images)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Initial project setup](#initial-project-setup)
  - [Inventory Configuration](#inventory-configuration)
  - [How to Run a Playbook](#how-to-run-a-playbook)
  - [Contributing](#contributing)
  - [License](#license)

## Prerequisites

- [uv](https://github.com/astral-sh/uv) - An extremely fast Python package installer and resolver.
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Initial project setup

It is recommended to use a virtual environment to install the Python dependencies. This project is configured to use `uv`.

1.  **Create the virtual environment**

    ```bash
    uv venv
    ```

2.  **Activate the virtual environment**

    ```bash
    source .venv/bin/activate
    ```

3.  **Install the dependencies from pyproject.toml**

    ```bash
    uv sync
    ```

## Inventory Configuration

Before running a playbook, you need to configure the inventory file.

1.  **Copy the example inventory file**

    ```bash
    cp ansible/inventory/hosts-example.yml ansible/inventory/hosts.yml
    ```

2.  **Update the `ansible/inventory/hosts.yml` file** with the IP address or hostname of the target machine.

## How to Run a Playbook

From the root of the project, run the `./cli` to execute a playbook.

You can list the available playbooks with:

```bash
./cli list
```

You can apply a specific playbook with:

```bash
./cli run <playbook-name>
```

## Contributing

Contributions are welcome! Please feel free to submit a pull request.

## License

This project is licensed under the MIT License.

