#!/bin/bash

set +m
for region in $(aws ec2 describe-regions --query "Regions[*].[RegionName]" --output text); do 
  aws ec2 describe-instances --region "$region" | jq ".Reservations[].Instances[] | {type: .InstanceType, state: .State.Name, tags: .Tags, zone: .Placement.AvailabilityZone}" &
done; wait; set -m
