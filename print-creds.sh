#!/bin/bash

echo ''
echo '  Printing Access Information:'
echo '  Some services may error out and provide incomplete information'
echo ''
for CRED in $(find * -type f -name access-creds.sh -executable | sort); do
  ${CRED}
done
