FROM node
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN apt-get update; apt-get install default-jdk -y; apt-get install maven -y
RUN apt-get install telnet -y; apt-get install iputils-ping -y
ENTRYPOINT [ "code-server", "--host", "0.0.0.0" ]
