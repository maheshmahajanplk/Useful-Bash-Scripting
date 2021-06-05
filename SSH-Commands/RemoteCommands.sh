# Author : Mahesh Mahajan
#!/bin/bash
# Name: RemoteCommands.sh
# Purpose: Run multiple commands on a remote box
# ----------------------------------------------------
#dump_file=systeminfo.txt
if [ $# -lt 1 ]
then
    echo "** Usage: "
    echo "**./RemoteCommands.sh <Remote_IP>"
    echo "** Example:"
    echo "** ./RemoteCommands.sh 10.93.84.47"
    exit 1
fi

echo "==========================[Host: $1]================================="
echo "Hostname : " `hostname`
echo "CPU cores:" `lscpu | grep "^CPU(s)" | awk '{print $2}'`
echo "Total Memory:" `free -g | grep "Mem:" | cut -d':' -f2 | awk '{print $1}'` "GB"
echo "Disk Space:" `fdisk -l | grep Disk | head -n 1 | awk '{ print $3 $4}'`
