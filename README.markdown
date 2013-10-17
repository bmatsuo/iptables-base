Configuration for Linux iptables

##Contents

This table contains a base iptables configuration, `etc/iptables.rules` for use
with `iptables-restore`. For comparison there is a shell script,
`iptables-init.sh`. This script generated the configurations, although either
can be used to initialize a firewall.

##Usage

To update etc/iptables.rules

    sudo ./iptables-init.sh > etc/iptables.rules

Persistant config across restarts

    sudo rsync -auv etc/ /etc/
