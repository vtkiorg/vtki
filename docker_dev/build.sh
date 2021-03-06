#!/bin/bash

# Developer script to build and push pyvista's docker image to github

set -e

# requires examples be build in advance...
rm -rf examples
mkdir examples
find ../docs/examples -name "*.ipynb" | xargs cp --parents -t examples
mv docs/examples/* examples
rm -rf docs

VERSION=v0.27.0
IMAGE=docker.pkg.github.com/pyvista/pyvista/pyvista-jupyterlab:$VERSION
docker build -t $IMAGE .
docker push $IMAGE
