FROM node
RUN curl -fsSL https://code-server.dev/install.sh | sh

ENTRYPOINT [ "code-server", "--port", "8086", "--host", "0.0.0.0" ]