#!/bin/bash
    cd /home/ubuntu
    git clone https://github.com/clicmdscript/easycmd.git
    cd easycmd/
    mv *.sh /home/ubuntu
    cd ..
    rm -rf easycmd/
    chmod +x *.sh
    ./install_awscli.sh
    