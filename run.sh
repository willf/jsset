#!/bin/bash
# unbind if bound
ps -awx | grep "ssh -f -N -L"  | grep "8012" | awk '{print $1}' | xargs  kill
# bind
ssh -f -N -L 8012:localhost:8012 ec2-50-18-237-212.us-west-1.compute.amazonaws.com
# 
open public/fretboard.html