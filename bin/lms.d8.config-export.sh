#!/bin/bash

rm -rf config/lms.d8.config/*
cd docroot
drush config-export --destination="../config/lms.d8.config/"
