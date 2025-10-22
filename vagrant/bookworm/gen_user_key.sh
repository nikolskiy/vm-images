#!/bin/bash

if [ -f ".private_key" ]; then
    echo "Private key already exists in the directory."
else
    # Generate a new ssh key pair
    ssh-keygen -t ed25519 -f .private_key -N ""

    # Remove old public key entry if it exists
    if [ -f ".env" ]; then
        sed -i '/^PUB_KEY=/d' .env
    fi

    # Create .env file with public key
    echo "PUB_KEY=\"$(cat .private_key.pub)\"" >> .env

    # Remove the public key file
    rm .private_key.pub
fi

