# Developer Environment VM Images

This project builds customized developer environment VM images using Packer and Ansible. It supports both QEMU/KVM and VirtualBox for local development.

## Prerequisites

- [Packer](https://www.packer.io/downloads)
- [uv](https://github.com/astral-sh/uv) - An extremely fast Python package installer and resolver.
- [QEMU](https://www.qemu.org/download/) (for QEMU builds)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (for VirtualBox builds)

## How to Build

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

2.  **Customize your build (optional):**
    You can modify the variables in `packer/common/variables.pkr.hcl` to change the VM's CPU, memory, disk size, and SSH credentials.

3.  **Build the VM image:**
    From the root of the project, run the `make build` command with the `VM` variable set to the desired Packer template.

    **For QEMU:**
    ```bash
    make build VM=ubuntu-dev-qemu
    ```

    **For VirtualBox:**
    ```bash
    make build VM=ubuntu-dev-virtualbox
    ```

3.  **Find your image:**
    The final VM image will be located in the `builds/` directory. QEMU images will be in `.qcow2` format, and VirtualBox images will be in `.ova` format.

## How to Validate

You can validate the Packer templates without running a full build:

```bash
make validate VM=ubuntu-dev-qemu
make validate VM=ubuntu-dev-virtualbox
```
