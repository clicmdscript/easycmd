#!/bin/bash

#import variable
region=eu-west-1
        source includes/_ec2_type.sh
        source includes/$region-ami.sh
        source All_Region_Function.sh