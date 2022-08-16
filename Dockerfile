FROM thebitcoinprof/just-joinmarket

ARG bitcoinCoreVersion

RUN mkdir /data /scripts

COPY config/joinmarket.cfg /data

COPY ./scripts/* /scripts/

RUN chmod +x /scripts/*

WORKDIR /tmp

ADD "https://bitcoincore.org/bin/bitcoin-core-$bitcoinCoreVersion/bitcoin-$bitcoinCoreVersion-x86_64-linux-gnu.tar.gz" /tmp/bitcoincore.tar.gz

RUN mkdir bitcoin && tar -xvzf /tmp/bitcoincore.tar.gz -C bitcoin --strip-components 1 \
    && mv bitcoin/bin/bitcoin-cli /bin/

#CMD /scripts/init.sh
CMD tail -f /dev/null
