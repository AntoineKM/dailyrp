FROM spritsail/fivem:latest

# Required for NGINX-Proxy
EXPOSE 40120

ADD server.cfg opt/cfx-server-data
ADD entrypoint /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint
RUN sed -i -e 's/\r$//' /usr/bin/entrypoint

# Default to an empty CMD, so we can use it to add seperate args to the binary
CMD [""]

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/entrypoint"]
