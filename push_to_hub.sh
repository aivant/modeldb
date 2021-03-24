#!/bin/bash

if [ "$#" -ne 1 ]; then
read -p "No tag provided. pushing images as :latest. Are you sure? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    tag="latest"
fi
else
tag=$1
fi

echo "updating images with tag $tag"

docker tag gcr.io/vantai-analysis/modeldb-backend:latest gcr.io/vantai-analysis/modeldb-backend:$tag
docker tag gcr.io/vantai-analysis/modeldb-proxy:latest gcr.io/vantai-analysis/modeldb-proxy:$tag
docker tag gcr.io/vantai-analysis/modeldb-frontend:latest gcr.io/vantai-analysis/modeldb-frontend:$tag
docker tag gcr.io/vantai-analysis/modeldb-graphql:latest gcr.io/vantai-analysis/modeldb-graphql:$tag

docker push gcr.io/vantai-analysis/modeldb-backend:$tag
docker push gcr.io/vantai-analysis/modeldb-proxy:$tag
docker push gcr.io/vantai-analysis/modeldb-frontend:$tag
docker push gcr.io/vantai-analysis/modeldb-graphql:$tag
