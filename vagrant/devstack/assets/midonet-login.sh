#!/bin/sh

KEY=$(curl -q -s -H "X-Auth-Project: admin" http://admin:midonet1q2w3e4r@localhost:8181/midonet-api/login | jq '.key')

echo KEY=$KEY > /tmp/midonet-key
