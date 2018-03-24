#! /bin/sh
#
# ffoxdocker.sh
# Copyright (C) 2018 Ryan Mackenzie White <ryan.white4@canada.ca>
#
# Distributed under terms of the  license.
#
# Run docker over host X11 socket
# http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/
#
# 
# used xhost + $IP
# create user in docker with same uid and gid
# set the Xauthority file the same -- not required
# Need to allow network connections in XQuartz security preferences

IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $IP
#docker run -e DISPLAY=$IP:0 -v $HOME/.Xauthority:/home/developer/.Xauthority gnucash
#docker run -e DISPLAY=$IP:0 gnucash
docker run -e DISPLAY=$IP:0 -v /Users/rwhite/Projects/dockers/gcash/data:/data gnucash 
