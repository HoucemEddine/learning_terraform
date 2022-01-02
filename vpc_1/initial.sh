#!/bin/bash

until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
	  sleep 1
  done

# install few stuff there 
apt-get update 
echo "update done here" > /tmp/finish-update


