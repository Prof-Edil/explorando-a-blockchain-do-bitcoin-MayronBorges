# How many new outputs were created by block 123,456?

#! /bin/bash

bitcoin-cli -rpcconnect=84.247.182.145:8332 -rpcuser=user_251 -rpcpassword=A8dgebPcPuu2 getblockstats 123456 | jq .outs
