#!/bin/bash -e

black() { printf "\e[30m" ; printf ${@} ; printf "\e[0m"; }
red() { printf "\e[31m" ; printf ${@} ; printf "\e[0m"; }
green() { printf "\e[32m" ; printf ${@} ; printf "\e[0m"; }
brown() { printf "\e[33m" ; printf ${@} ; printf "\e[0m"; }
blue() { printf "\e[34m" ; printf ${@} ; printf "\e[0m"; }
purple() { printf "\e[35m" ; printf ${@} ; printf "\e[0m"; }
cyan() { printf "\e[36m" ; printf ${@} ; printf "\e[0m"; }
gray() { printf "\e[37m" ; printf ${@} ; printf "\e[0m"; }

normal() { printf "\e[0m" ; printf ${@} ; printf "\e[0m"; }
bold() { printf "\e[1m" ; printf ${@} ; printf "\e[0m"; }
underline() { printf "\e[4m" ; printf ${@} ; printf "\e[0m"; }
blink() { printf "\e[5m" ; printf ${@} ; printf "\e[0m"; }

black_bg() { printf "\e[40m" ; printf ${@} ; printf "\e[0m"; }
red_bg() { printf "\e[41m" ; printf ${@} ; printf "\e[0m"; }
green_bg() { printf "\e[42m" ; printf ${@} ; printf "\e[0m"; }
brown_bg() { printf "\e[43m" ; printf ${@} ; printf "\e[0m"; }
blue_bg() { printf "\e[44m" ; printf ${@} ; printf "\e[0m"; }
purple_bg() { printf "\e[45m" ; printf ${@} ; printf "\e[0m"; }
cyan_bg() { printf "\e[46m" ; printf ${@} ; printf "\e[0m"; }
gray_bg() { printf "\e[47m" ; printf ${@} ; printf "\e[0m"; }

# echo -e $(bold $(red text output))

find * -type f -name access-creds.sh -executable | sort | xargs -i source {}
