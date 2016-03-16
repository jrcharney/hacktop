#!/bin/bash
# TODO: find more filters

# fonts are in usr/share/figlet
# filters are gay (rainbow) and metal. try `--filter list`.

toilet -w $(tput cols) -F gay -f bigmono12 $1
