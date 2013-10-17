Configuration for Linux iptables

##Contents

This repository contains a script to create a set of iptables rules,
`etc/iptables.rules` for use with `iptables-restore`. For comparison,
there is a shell script `iptables-init.sh` which performs the same
initialization.

##Usage

To update etc/iptables.rules

    sudo ./iptables-init.sh > etc/iptables.rules

Persistant config across restarts

    sudo rsync -auv etc/ /etc/
