#!/bin/bash

PATH=/usr/local/gnat/bin:$PATH; export PATH;
FILENAME=$1.adb
gcc -c $FILENAME && gnatbind $1 && gnatlink $1 && gnatmake $1
