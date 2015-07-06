#!/bin/sh

INSTANCE_IDS=$(aws elb describe-instance-health --load-balancer-name=prd-lb-dlv --query "InstanceStates[*].InstanceId" --output text)
HOSTNAMES=($(aws ec2 describe-instances --instance-ids $INSTANCE_IDS --query "Reservations[*].Instances[*].Tags[*].Value" --output text | sort))
pane=0

tmux-split-pane.sh ${#HOSTNAMES[@]}
sleep 2

for HOSTNAME in ${HOSTNAMES[*]}
do
    tmux select-pane -t $pane
    tmux send-keys "ssh ${HOSTNAME}.in.tgmm.jp" C-m
    pane=$(expr ${pane} + 1)
done
