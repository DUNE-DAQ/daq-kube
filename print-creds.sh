#!/bin/bash

for CRED in $(find * -type f -name access-creds.sh -executable | sort); do
  ${CRED}
done
