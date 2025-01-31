# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`

#!/bin/bash 

transaction1=$(bitcoin-cli -rpcconnect=84.247.182.145:8332 -rpcuser=user_251 -rpcpassword=A8dgebPcPuu2 getrawtransaction 37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517 1)

pub1=$(echo "$transaction1" | jq -r '.vin[0].txinwitness[1]')

pub2=$(echo "$transaction1" | jq -r '.vin[1].txinwitness[1]')

pub3=$(echo "$transaction1" | jq -r '.vin[2].txinwitness[1]')

pub4=$(echo "$transaction1" | jq -r '.vin[3].txinwitness[1]')

mymultisig=$(bitcoin-cli -rpcconnect=84.247.182.145:8332 -rpcuser=user_251 -rpcpassword=A8dgebPcPuu2 createmultisig 1 "[\"$pub1\",\"$pub2\",\"$pub3\",\"$pub4\"]")

echo $mymultisig | jq -r '.address'



