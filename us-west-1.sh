#!/bin/bash

#import variable
region=us-west-1
        source includes/_ec2_type.sh
        source includes/$region-ami.sh
        source All_Region_Function.sh