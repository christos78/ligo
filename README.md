1) Lancement d'un node
    ./src/bin_node/tezos-sandboxed-node.sh 1 --connections 1

2) Lancement du tezos client
    eval `./src/bin_client/tezos-init-sandboxed-client.sh 1`

3) Activation du compte 

    tezos-client rpc get /chains/main/blocks/head/metadata
    tezos-activate-alpha
4) Compilation du contrat 
    ligo compile-contract smart_contract.ligo main 
