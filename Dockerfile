FROM spritsail/fivem:latest

# Required for NGINX-Proxy
EXPOSE 40120

ADD entrypoint /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint
RUN sed -i -e 's/\r$//' /usr/bin/entrypoint

ENTRYPOINT ["/usr/bin/entrypoint"]

