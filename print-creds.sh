#!/bin/bash

echo ''
echo '  Printing Access Information:'
echo ''
for CRED in $(find * -type f -name access-creds.sh -executable | sort); do
  ${CRED}
done
