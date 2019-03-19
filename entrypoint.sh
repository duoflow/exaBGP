#!/bin/bash
# create directory fot FTP data
export exabgp.profile.enable=true
export exabgp.profile.file=~/profile.log
export exabgp.log.packets=true
export exabgp.log.destination=host:127.0.0.1
export exabgp.daemon.user=wheel
export exabgp.daemon.daemonize=true
export exabgp.daemon.pid=/var/run/exabpg.pid
# start serice
./exaBGPinstance/exabgp /exaBGPinstance/conf/exabgp.conf