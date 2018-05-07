#!/bin/sh

set -e

packer build -force ./jumphost.json

