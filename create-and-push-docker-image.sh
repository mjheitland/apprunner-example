#!/usr/bin/env bash
set -euo pipefail # e = terminates immediately on error, u = check for undefined variables, -o pipefail = extends 'e' to pipes

region=eu-west-1
app=mywebserver

aws ecr get-login-password --region $region | docker login --username AWS --password-stdin 094033154904.dkr.ecr.$region.amazonaws.com/$app

docker build -t $app .

docker tag $app:latest 094033154904.dkr.ecr.$region.amazonaws.com/$app:latest

if ! aws ecr describe-repositories --region $region --repository-names $app 2>/dev/null; then
    aws ecr create-repository --region $region --repository-name $app
fi

docker push 094033154904.dkr.ecr.$region.amazonaws.com/$app:latest
