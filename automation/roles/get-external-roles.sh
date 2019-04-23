#!/bin/sh

set -e 

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Remove existing roles
rm -fR $SCRIPT_DIR/external/*

# Run ansible-galaxy
ansible-galaxy install -r $SCRIPT_DIR/external-roles.yml -p $SCRIPT_DIR/external

