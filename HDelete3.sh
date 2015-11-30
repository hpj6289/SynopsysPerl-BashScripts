#!/bin/sh

##########################
##########################
# Author : Himanshu Joshi#
# Copyright Synopsys Inc #   
# All Rights Reserved    #               
#                        #
#                        #
#                        #
##########################
##########################

######################### PARTIALLY COMPLETE CODE! WORK IN PROGRESS ##########################


host=$1

name=$2
file=$3


`ssh $host grep -w $name | sed -i "/{/{:1;N;s/{.*}//;T1}" $file` 


