#!/bin/bash

sudo rm -rf docroot/dist/
cd frontang
rm -rf dist
sudo rm -rf .tmp
grunt --force && sudo mv dist ../docroot