#!/bin/bash

# General params
readonly DVER="8.0.0-beta6"
readonly SITENAME="lms.drupal8.loc" 
readonly DBNAME="lms_drupal8_loc"

# MySQL credentials
readonly DBSERVER="localhost"
readonly DBLOGIN="root"
readonly DBPSWD="root"

# Drupal credentials
readonly DRUPLOGIN="d8admin"
readonly DRUPPSWD="password"
readonly DBCONN="mysql://$DBLOGIN:$DBPSWD@$DBSERVER/$DBNAME"

# Download Drupal
drush7 dl drupal-8
mv docroot docroot.old
mv drupal-$DVER docroot
cd docroot

drush7 si minimal --db-url="$DBCONN" --account-name=$DRUPLOGIN --account-pass=$DRUPPSWD --yes
drush7 config-import config/lms.d8.config