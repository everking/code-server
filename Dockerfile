FROM node
# Core VS Code server install
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Dev/build tools
RUN apt-get update; apt-get install default-jdk -y; apt-get install maven -y

# Network tools
RUN apt-get install telnet -y; apt-get install iputils-ping -y; apt-get install dnsutils -y

# Editors
RUN apt-get install vim -y; apt-get install nano -y

ENTRYPOINT [ "code-server", "--host", "0.0.0.0" ]
