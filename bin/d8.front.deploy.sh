#!/bin/bash

cd frontang
rm -rf dist
grunt
cd ..
mv frontang/dist docroot/_dist