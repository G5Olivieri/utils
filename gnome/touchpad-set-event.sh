#!/bin/bash

help() {
  cat <<EOF
$0 <option>

Options are:
    enabled
    disabled
    disabled-on-external-mouse

EOF

exit
}

contains() {
  value=$1
  array=$2

  for item in ${array[*]}; do
    if [ "$value" == "$item" ]; then
      return 0
    fi
  done

  return 1
}

check() {
  if [ -z "$option" ]; then
    help
  fi

  if ! contains "$option" "${options[*]}"; then
    help
  fi
}

options=(enabled disabled disabled-on-external-mouse)
option=$1

check

gsettings set org.gnome.desktop.peripherals.touchpad send-events "$option"

echo -n "Touchpad $option"
