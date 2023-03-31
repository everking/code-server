# This assumes that you have /root as your main local working folder.
docker kill code-server
docker rm code-server

if [ -z "${CODE_PORT}" ]
then
  CODE_PORT=8086
fi

CONTAINER_ID=$(docker run -it --name code-server \
  -d -v /root:/root \
  -p ${CODE_PORT}:8080 -w /root code-server)

docker logs -f ${CONTAINER_ID}
