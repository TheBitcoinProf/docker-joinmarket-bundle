FROM joinmarket-base

RUN mkdir /conf /data

COPY ./presetBitcoinConfigs/ /conf/

ADD "https://bitcoincore.org/bin/bitcoin-core-23.0/bitcoin-23.0-x86_64-linux-gnu.tar.gz" /tmp/bitcoincore.tar.gz

WORKDIR /tmp

RUN tar -xvzf /tmp/bitcoincore.tar.gz \
    && mv bitcoin-23.0/bin/* /bin/

CMD bitcoind -conf=/conf/pruned-bitcoin.conf