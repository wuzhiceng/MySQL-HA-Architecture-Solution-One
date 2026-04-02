#!/bin/bash
while true;do
    if [ `ps aux | grep mha.cnf1 | grep -v grep | wc -l` -eq 0 ];then
        nohup masterha_manager --conf=/etc/mha.cnf1 --remove_dead_master_conf --ignore_last_failover < /dev/null &>/var/log/mha.log &
    fi

    if [ `ps aux | grep mha.cnf2 | grep -v grep | wc -l` -eq 0 ];then
        nohup masterha_manager --conf=/etc/mha.cnf2 --remove_dead_master_conf --ignore_last_failover < /dev/null &>/var/log/mha.log &
    fi
    sleep 10
done
##这个脚本的作用就是一直循环检测MHA是否停止了，如果停止了就启动，为防止MHA频繁停止启动，每次启动后停止10秒。至于为什么要这样，因为MHA帮助故障切换一次后就会停止运行
