#!/bin/bash

# Load environment variables from .env file
if [ -f "/vagrant/.env" ]; then
  export $(cat "/vagrant/.env" | sed 's/#.*//g' | xargs)
fi

# Validate that USERNAME and PASSWORD are not empty
if [ -z "$USERNAME" ] || [ -z "$PASSWORD" ]; then
  echo "Error: USERNAME and PASSWORD must be set in the .env file." >&2
  exit 1
fi

# Check if the user already exists
if id "$USERNAME" &>/dev/null; then
    echo "User '$USERNAME' already exists. Skipping user creation."
else
    echo "Creating user '$USERNAME'..."
    # Create the user with a home directory, bash as the default shell, and add to the sudo group.
    useradd -m -s /bin/bash -G sudo $USERNAME
    echo "User '$USERNAME' created successfully"
fi

# Set the password for the user.
# The chpasswd command reads 'username:password' pairs from standard input.
echo "$USERNAME:$PASSWORD" | chpasswd
echo "User '$USERNAME' password was updated."

echo "Checking sudo privileges for '$USERNAME'..."
if [ -f "/etc/sudoers.d/$USERNAME" ]; then
    echo "User '$USERNAME' already has sudo privileges. Skipping."
else
    echo "Granting sudo privileges to '$USERNAME'..."
    # Add the user to the sudoers file with passwordless access.
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME
    # Set the correct permissions for the sudoers file.
    chmod 0440 /etc/sudoers.d/$USERNAME

    echo "Sudo privileges granted to '$USERNAME'."
fi

