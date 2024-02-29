docker build . -t code-server
docker tag code-server everking/code-server
docker push everking/code-server