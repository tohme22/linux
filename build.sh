#!/bin/bash

rm -rf public
hugo

ssh -p 65002 u254462768@82.180.175.126 "rm -rf /home/u254462768/domains/itmt-prof.com/public_html/linux1/*"
scp -rP 65002 public/* u254462768@82.180.175.126:public_html/linux1/