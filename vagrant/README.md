# Vagrant Virtual Machines

This directory contains subdirectories with Vagrant configurations for virtual machines. Each subdirectory represents a specific virtual machine setup.

## Available Machines

### bookworm-xfce

This directory contains everything needed to build a Debian Bookworm OS with the XFCE desktop environment.

## Prerequisites

- [Vagrant](https://www.vagrantup.com/) must be installed on the host system.

## Usage

To build and manage the virtual machines, use the `vagrant` command from within the respective subdirectory.

For example, to bring up the `bookworm-xfce` machine:

```bash
cd bookworm-xfce
vagrant up
```

Other common commands include:

- `vagrant halt`: Stops the machine.
- `vagrant destroy`: Deletes the machine.
- `vagrant ssh`: Connects to the machine via SSH.
