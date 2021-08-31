#!/usr/bin/env bash

set -eou pipefail


day_column=8
start_column=9
end_column=11
client_column=3
project_column=4
task_column=6

function extract() {
  file=$1
  column=$2
  cat "$file" | cut -d',' -f"$column" | tail -n +2
}

file=$1

case $2 in
  day) extract "$file" "$day_column" ;;
  start) extract "$file" "$start_column" ;;
  end) extract "$file" "$end_column" ;;
  client) extract "$file" "$client_column" ;;
  project) extract "$file" "$project_column" ;;
  task) extract "$file" "$task_column" ;;
  *) echo "NAAAAAAAAAAAAAAAO" ;;
esac
