#!/bin/sh

set -e

packer build -force ./devenv-java.json

