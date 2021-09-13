#!/usr/bin/env bash

set eou -pipefail

sed -i '0,/credentials.*$/s//credentials: CREDENTIALS/' azure-provider.yaml

