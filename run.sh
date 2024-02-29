# This assumes that you have /root as your main local working folder.
export CONTAINER_NAME=code-server
export IMAGE_ID=everking/${CONTAINER_NAME}

echo "CONTAINER_NAME=${CONTAINER_NAME}"
echo "IMAGE_ID=${IMAGE_ID}"

docker kill ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

if [ -z "${CODE_PORT}" ]
then
  CODE_PORT=8086
fi

docker run -it --name ${CONTAINER_NAME} \
  -d \
  -v /mnt/f/dev:/app/dev \
  -v ${HOME}/.ssh/id_rsa:/root/.ssh/id_rsa \
  -v ${HOME}/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
  -v ${PWD}/config.yaml:/root/.config/code-server/config.yaml \
  -v ${PWD}/share:/root/.local/share \
  -v ${PWD}/bashrc:/root/.bashrc \
  -u root \
  -p ${CODE_PORT}:8080 -w /root ${IMAGE_ID}

docker logs -f ${CONTAINER_NAME}
