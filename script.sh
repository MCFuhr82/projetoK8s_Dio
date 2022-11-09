#!/bin/bash

echo "Criando imagens......"

docker build -t mcfuhr/projeto-backend:1.0 backend/.
docker build -t mcfuhr/projeto-database:1.0 database/.

echo "Push das imagens no docker hub"

docker push mcfuhr/projeto-backend:1.0
docker push mcfuhr/projeto-database:1.0

echo "Criando serviços no cluster kubernetes...."

kubectl apply -f ./services.yml

echo "Criando os deployments.."

kubectl apply -f ./deployment.yml