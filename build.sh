docker build --platform linux/amd64 . -t code-server
docker tag code-server everking/code-server
docker push everking/code-server