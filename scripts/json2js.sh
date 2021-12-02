#!/usr/bin/env bash

set -eou pipefail

cat <<EOF | sed -r 's/^(\s*)"(\w*)":/\1\2:/g' | sed "s/\"/'/g"
{
  "key": "value",
  "obj": {
    "nested": "value",
  },
  "array": [
    "don't remove this",
    "don't remove this"
  ]
}
EOF

