FROM joinmarket-base

RUN mkdir /data

COPY ./joinmarket.cfg /data

CMD sleep 1m && python3 /jm/clientserver/scripts/wallet-tool.py --datadir=/data generate

#CMD python3 /jm/clientserver/scripts/wallet-tool.py --datadir=/data