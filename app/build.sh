#!/bin/bash
docker build -t $USERNAME/nginx:licensed-0.0.1 app/
docker push $USERNAME/nginx:licensed-0.0.1