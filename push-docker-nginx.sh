#!/bin/bash 

#Execute os seguinte comandos para permitir o terminal local

 gcloud auth configure-docker \
    southamerica-east1-docker.pkg.dev 

#Coloca TAG na imagem docker a ser enviada
docker tag guisousa/nginx-hello-world:latest southamerica-east1-docker.pkg.dev/develop-348618/nginx-reppo/guisousa/nginx-hello-world:latest

#Faz o envio da imagem para o repositorio
docker push southamerica-east1-docker.pkg.dev/develop-348618/nginx-reppo/guisousa/nginx-hello-world:latest


