FROM alpine:3.18.3

# Setup tailscale
WORKDIR /root

COPY start.sh /root/start.sh

ENV TAILSCALE_HOSTNAME "railway-app"
ENV TAILSCALE_ADDITIONAL_ARGS ""

RUN apk update && apk add tailscale ca-certificates iptables ip6tables && rm -rf /var/cache/apk/*

RUN mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale

RUN chmod +x start.sh
CMD ["/root/start.sh"]
