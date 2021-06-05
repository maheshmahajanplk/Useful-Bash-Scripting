#!/bin/bash
# Name : RemoteInfo.sh
# Input: Filename in which IP is kept on each new line
# Purpose : Fetch IP from servers.txt login to remote machine & get CPU cores,Memory,Disksizei
# Author  : Mahesh Mahajan
#---------------------------------------------------------------------------------------------------------------
# Prerequisites : sshpass to be installed with openssh client & ssh keys to shared across all the Remote machines
# Additional Info : Linux Command to check devices present into your network "sudo nmap -sn 192.168.1.0/24"
#------------------------------------------------------------------------------------------------------------------
if [ $# -lt 1 ]
then
    echo "** Usage: "
    echo "**./RemoteCommands.sh <ServersList>"
    echo "** Example:"
    echo "** ./RemoteCommands.sh RemoteMachineList.txt"
    exit 1
fi

while read HOST_IP ;
do
   sshpass -p 'ubuntu' ssh root@${HOST_IP} 'bash -s' < /home/mahesh/GitHub/Useful-Bash-Scripting/SSH-Commands/RemoteCommands.sh ${HOST_IP} >> CpuDiskMemInfo.txt
done < $1
