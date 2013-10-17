A base configuration for Linux iptables. This is a simple, restrictive firewall.
It is structured as to be easily extended as necessary.

##Contents

This table contains a base iptables configuration, `etc/iptables.rules` for use
with `iptables-restore`. For comparison there is a shell script,
`iptables-init.sh`. This script generated the configurations, although either
can be used to initialize a firewall.

##Description

The only incoming connections allowed are those on the loopback interface or
those on tcp ports 22 (ssh), 80 (http), or 443 (https).

Outgoing and forward connections are not restricted (FIXME).

##Usage

Apply configuration and update etc/iptables.rules

    sudo ./iptables-init.sh > etc/iptables.rules

Persistant config across restarts (be sure you know what you're doing)

    sudo rsync -auv etc/ /etc/
    sudo iptables-restore < /etc/iptables.rules
