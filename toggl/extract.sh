#!/usr/bin/env bash

set -eou pipefail


function extract() {
  file=$1
  column=$2
  cat "$file" | cut -d',' -f"$column" | tail -n +2
}

function usage() {
  local script_name=$0
  echo -e "Usage:\n\t$script_name [column] [FILE]\ncolumns:\n\tday, start, end, client, project, task"
}

if [ "$#" -lt "2" ]; then
  usage
  exit 0
fi

file=$2

day_column=8
start_column=9
end_column=11
client_column=3
project_column=4
task_column=6

case $1 in
  day) extract "$file" "$day_column" ;;
  start) extract "$file" "$start_column" ;;
  end) extract "$file" "$end_column" ;;
  client) extract "$file" "$client_column" ;;
  project) extract "$file" "$project_column" ;;
  task) extract "$file" "$task_column" ;;
  *) echo "NAAAAAAAAAAAAAAAO" ;;
esac
