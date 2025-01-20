#!/bin/bash
set -e
aws_region="ap-south-1"
ecr_repo="ECR REPO URL"
git_url="<GIT REPO URL>"
git clone $git_url
cd nodejsapp-demo
docker build -t nodeapp .
docker tag nodeapp:latest $ecr_repo:latest
aws ecr get-login-password --region $aws_region | docker login --username AWS --password-stdin ACCOUNTNO.dkr.ecr.$aws_region.amazonaws.com
docker tag nodeapp:latest $ecr_repo/nodeapp:latest
docker push ACCOUNTNO.dkr.ecr.$aws_region.amazonaws.com/nodeapp:latest
