#!/bin/bash

cd docroot
drush make-generate ../config/d8.lms.courses.make --include-versions
