#!/bin/sh

if [ -f /tmp/midonet-key ]; then
  . /tmp/midonet-key
fi

curl -H "X-Auth-Token: $KEY" -s -q http://localhost:8181/midonet-api/$@ | jq
