#!/bin/bash

IPTABLES="/sbin/iptables"
IPTABLES_SAVE="/sbin/iptables-save"

# log message prefix for dropped connections
IPTABLES_DROP_LOG_PREFIX="iptables	DROP	" # hard tabs, \t didn't work (FIXME)

# drop existing configurations

$IPTABLES -F
$IPTABLES -X

$IPTABLES -t nat -F
$IPTABLES -t nat -X

$IPTABLES -t mangle -F
$IPTABLES -t mangle -X

# inbound connections

$IPTABLES   -P INPUT    DROP # drop unmatched(?)
$IPTABLES   -A INPUT    -i lo                                           -j ACCEPT   # loopback
$IPTABLES   -A INPUT    -m conntrack    --ctstate ESTABLISHED,RELATED   -j ACCEPT   # established sessions
$IPTABLES   -A INPUT    -p tcp          --dport 22                      -j ACCEPT   # ssh
$IPTABLES   -A INPUT    -p tcp          --dport 80                      -j ACCEPT   # http
$IPTABLES   -A INPUT    -p tcp          --dport 443                     -j ACCEPT   # https
$IPTABLES   -A INPUT    -m limit        --limit 5/min                   -j LOG \
                        --log-prefix "$IPTABLES_DROP_LOG_PREFIX"    --log-level 7

$IPTABLES_SAVE # outputs to stdout
