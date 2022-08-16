#!/bin/bash

BITCOIN_CLI_COMMAND="bitcoin-cli -rpcconnect=bitcoin-node -rpccookiefile=/auth/.cookie"
BITCOIN_CORE_HEALTH_CHECK="${BITCOIN_CLI_COMMAND} getblockcount"
CONF_FILE=/data/joinmarket.cfg

while [ ! "${BITCOIN_CORE_HEALTH_CHECK}" ]
do
  echo "The Bitcoin node is not ready yet. Waiting..."
  sleep 1m
done

echo "The Bitcoin node is up and running! Starting Joinmarket"

rpcWalletFile=$(grep ^rpc_wallet_file $CONF_FILE)

if [[ $rpcWalletFile == *"AUTOGEN"* ]]; then
  echo "Creating watch only wallet on Bitcoin node"
  ${BITCOIN_CLI_COMMAND} -named createwallet wallet_name=joinmarket_wallet descriptors=false
fi