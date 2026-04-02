#!/bin/bash
kill `ps aux | grep masterha_start.sh | grep -v grep | awk '{print $2}'` >/dev/null
masterha_stop --conf=/etc/mha.cnf
