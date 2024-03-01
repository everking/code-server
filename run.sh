# This assumes that you have /root as your main local working folder.
export CONTAINER_NAME=code-server
export IMAGE_ID=everking/${CONTAINER_NAME}

echo "CONTAINER_NAME=${CONTAINER_NAME}"
echo "IMAGE_ID=${IMAGE_ID}"

docker kill ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

if [ -z "${CODE_PORT}" ]
then
  export CODE_PORT=8086
fi
echo "CODE_PORT=${CODE_PORT}"

if [ -z "${DEV_FOLDER}" ]
then
  # Make your code reachable by code-server
  export DEV_FOLDER="${HOME}"
fi

if [ -z "${HOST_USER}" ]
then
    export HOST_USER="root"
fi
if [ -z "${HOST_PORT}" ]
then
    export HOST_PORT="22"
fi

if [ -z "${SSH_HOST}" ]
then
  export SSH_HOST="host.docker.internal"
fi

if [ -z "${ID_RSA_PATH}" ]
then
  export ID_RSA_PATH="${HOME}/.ssh/id_rsa"
fi

export CODE_DATA_FOLDER="${HOME}/dev/${CONTAINER_NAME}-data"

# Create data folder structure

mkdir -p ${CODE_DATA_FOLDER}/share

envsubst < bashrc-template > ${CODE_DATA_FOLDER}/bashrc

if [ -z "${CODE_SERVER_PASSWORD}" ]
then
  export CODE_SERVER_PASSWORD="insecure"
fi

envsubst < config.yaml-template > ${CODE_DATA_FOLDER}/config.yaml

docker run -it --name ${CONTAINER_NAME} \
  -d \
  -v ${DEV_FOLDER}:/app/dev \
  -v ${ID_RSA_PATH}:/root/.ssh/id_rsa \
  -v ${ID_RSA_PATH}.pub:/root/.ssh/id_rsa.pub \
  -v ${CODE_DATA_FOLDER}/config.yaml:/root/.config/code-server/config.yaml \
  -v ${CODE_DATA_FOLDER}/share:/root/.local/share \
  -v ${CODE_DATA_FOLDER}/bashrc:/root/.bashrc \
  -u root \
  -p ${CODE_PORT}:8080 -w /root ${IMAGE_ID}

docker logs -f ${CONTAINER_NAME}
