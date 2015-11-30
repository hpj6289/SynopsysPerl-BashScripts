#!/bin/sh

##############################################
# Author : Himanshu Joshi                    #
# Date :11/27/2015                           # 
# Copyright Synopsys                         #
# All Rights Reserved                        #
##############################################

HOSTS=$1
var=$2
sub=$3
path=$4


`ssh  $HOSTS | sed -i  "s/$var/$sub/" "$path"`
echo "FINISHED SUBSTITUTION ! PLEASE EXIT AND CHECK YOUR FILE"
