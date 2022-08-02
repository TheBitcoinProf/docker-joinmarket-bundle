FROM joinmarket-base

RUN mkdir /data

COPY ./joinmarket.cfg /data

#CMD sleep 5m && python3 /jm/clientserver/scripts/wallet-tool.py --datadir=/data generate

CMD tail -f /dev/null
#CMD python3 /jm/clientqserver/scripts/wallet-tool.py --datadir=/data