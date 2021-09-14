#!/bin/bash

# 1000 Lowest value (really red)
# 4000 Default night light temperature
# 5500 More pleasant and less intense night light temperature
# 6500 Default temperature (night light off)
# 10000 Highest value (really blue)

help() {
  cat <<EOF
$0 <temperature>

temperature range:
            1000 Lowest value (really red)
            4000 Default night light temperature
            5500 More pleasant and less intense night light temperature
            6500 Default temperature (night light off)
            10000 Highest value (really blue)

EOF

exit
}

check() {
  if [ -z "$temperature" ]; then
    help
  fi

  if [ "$temperature" -lt "1000" ] || [ "$temperature" -ge "10000" ]; then
    help
  fi
}

temperature=$1

check

gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature "$temperature"
