#!/bin/bash 

# Execute os seguinte comandos para permitir o terminal local
# Substituindo "southamerica-east" pela região correspondente

# gcloud auth configure-docker \
#    southamerica-east1-docker.pkg.dev 

#Variaveis
DOCKER_IMAGE=guisousa/nginx-hello-world:latest
DOCKER_REPO=southamerica-east1-docker.pkg.dev/develop-348618/nginx-reppo/

#Comando para fazer o tag da imagem com o repositorio
docker tag "$DOCKER_IMAGE" "$DOCKER_REPO$DOCKER_IMAGE"

#Contatena variaveis do repositorio com imagem
DOCKER_ENVIA=$DOCKER_REPO$DOCKER_IMAGE

#Encia imagem 
docker push $DOCKER_ENVIA
