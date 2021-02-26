#!/bin/bash

rm -rf /home/jovyan/.jupyter/jupyter_notebook_config.json

echo "teste" > /home/jovyan/teste.txt
git config --system user.name $JUPYTERHUB_USER
git config --system user.email $JUPYTERHUB_USER@example.com
