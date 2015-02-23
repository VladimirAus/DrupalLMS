#!/bin/bash

# General params
# readonly DVER="8.0.0-beta6"
readonly DVER="8.0.x-dev"
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

readonly LMSCONFIG="lms.d8.config"

# Download Drupal
# drush dl drupal-8.0.x # install latest Drupal
sudo rm -rf docroot
# mv drupal-$DVER docroot
drush make config/d8.lms.courses.make docroot --yes
cd docroot
# sudo chmod -R 777 sites/default/files

# drush sql-create --db-url="$DBCONN" --yes
drush si minimal --db-url="$DBCONN" --account-name=$DRUPLOGIN --account-pass=$DRUPPSWD --yes
drush en bartik --yes
drush dis stark --yes
chmod 755 sites/default/settings.php

# cp -r ../config/$LMSCONFIG sites/default/files
# mv sites/default/files/$LMSCONFIG sites/default/files/config_$LMSCONFIG
# chmod -r 775 sites/default/files/config_$LMSCONFIG
# echo "\$config_directories['$LMSCONFIG'] = 'sites/default/files/config_$LMSCONFIG';" >> sites/default/settings.php
SITEUUID="uuid: $(drush7 config-get system.site uuid --format=string)"

drush config-export staging -y
cd sites/default/files/
CONFIGDIR="$(ls -d c* | head -1)"
cd ../../../../config/$LMSCONFIG
cp -Rf . ../../docroot/sites/default/files/$CONFIGDIR/staging/

# Following commands do not work in core beta6 and earlier
# Comment all commands and proceed to instaructons

# replace import UUID with site UUID
cd ../..
sed -i.bak "1s/.*/$SITEUUID/" docroot/sites/default/files/$CONFIGDIR/staging/system.site.yml

cd docroot/

drush en config -y
drush config-import staging -y

# name is not set via config at the moment
# drush config-set system.site name 'Project Lantern' -y

