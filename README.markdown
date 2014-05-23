A base configuration for Linux iptables. This is a simple, restrictive firewall.
It is structured as to be easily extended as necessary.

##Contents

This table contains a base iptables configuration, `etc/iptables.rules` for use
with `iptables-restore`. For comparison there is a shell script,
`iptables-init.sh`. This script generated the configurations, although either
can be used to initialize a firewall.

##Description

The only incoming connections allowed are those on the loopback interface or
those on tcp ports 22 (ssh), 80 (http), 443 (https), or 6667 (znc).

Outgoing and forward connections are not restricted (FIXME).

Dropped connections are logged on a limited basis.

##Usage

Apply configuration and update etc/iptables.rules

    sudo ./iptables-init.sh > etc/iptables.rules

Update config and persistant across restarts (be sure you know what you're doing)

    rsync -auv etc/ /etc/
    /etc/network/if-pre-up.d/iptablesload

Reload config from the repository copy, even if it is not newer

    rsync -av etc/ /etc/
    /etc/network/if-pre-up.d/iptablesload
