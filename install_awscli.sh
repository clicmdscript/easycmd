#!/bin/bash

sudo apt update
sudo apt install software-properties-common
yes '' |sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.8

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install


#require plugin JQ
sudo apt install -y jq

echo "done"