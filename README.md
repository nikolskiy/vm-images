# Developer Environment VM Images

This project uses Ansible to configure developer environments.

## Prerequisites

- [uv](https://github.com/astral-sh/uv) - An extremely fast Python package installer and resolver.
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## How to Run a Playbook

1.  **Set up the Python virtual environment:**
    It is recommended to use a virtual environment to install the Python dependencies. This project is configured to use `uv`.

    Create the virtual environment

    ```bash
    uv venv
    ```

    Install the dependencies from pyproject.toml

    ```bash
    uv sync
    ```

    Activate the virtual environment
    ```bash
    source .venv/bin/activate
    ```

2.  **Run a playbook:**
    From the root of the project, run the `cli` to execute a playbook.

    ```bash
    ./cli run <playbook-name>
    ```

    You can list the available playbooks with:
    ```bash
    ./cli list
    ```
