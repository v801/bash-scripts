#!/usr/bin/env bash

# stop and disable ssh
sudo systemctl stop --now ssh 
sudo systemctl disable --now ssh
