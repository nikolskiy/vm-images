# Developer Environment VM Images

This project builds customized developer environment VM images using Packer and Ansible. It supports both QEMU/KVM and VirtualBox for local development.

## Prerequisites

- [Packer](https://www.packer.io/downloads)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [QEMU](https://www.qemu.org/download/) (for QEMU builds)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (for VirtualBox builds)

## How to Build

1.  **Customize your build (optional):**
    You can modify the variables in `packer/common/variables.pkr.hcl` to change the VM's CPU, memory, disk size, and SSH credentials.

2.  **Build the VM image:**
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
