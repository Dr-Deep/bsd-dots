#!/bin/sh

ping -c 1 1.1.1.1 >/dev/null

if [ $? != 0 ] ; then
    echo "offline"
else
    echo "online"
fi
