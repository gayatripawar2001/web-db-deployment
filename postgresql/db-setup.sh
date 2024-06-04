#!/bin/bash

# Update the package index
sudo apt update

# Install wget and ca-certificates if not already installed
sudo apt install -y wget ca-certificates

# Get the certificate, add it to apt-key management utility, and create a new configuration file with an official PostgreSQL repository address inside
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Add the PostgreSQL repository to the sources list
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

# Update the package index again to include the PostgreSQL repository
sudo apt update

# Install PostgreSQL and PostgreSQL contrib packages
sudo apt install -y postgresql postgresql-contrib