FROM registry.gautier.local:5000/alpine:3.8

COPY torrc.tpl /etc/tor/torrc.tpl
COPY setup /usr/local/bin/setup
COPY entrypoint /usr/local/bin/entrypoint
COPY credentials /usr/local/bin/credentials

RUN apk add --no-cache pwgen tor ; \
    cp /etc/tor/torrc.tpl /etc/tor/torrc ; \
    chown -R tor:nogroup /etc/tor ; \
    chmod +x /usr/local/bin/setup /usr/local/bin/entrypoint /usr/local/bin/credentials

EXPOSE 9050 9051
VOLUME ["/var/lib/tor"]
USER tor

CMD ["/usr/local/bin/entrypoint"]
