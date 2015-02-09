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

readonly LMSCONFIG="lms.d8.config"

# Download Drupal
drush7 dl drupal-8
rm -rf docroot
mv drupal-$DVER docroot
cd docroot

drush7 si minimal --db-url="$DBCONN" --account-name=$DRUPLOGIN --account-pass=$DRUPPSWD --yes
# cp -r ../config/$LMSCONFIG sites/default/files
# mv sites/default/files/$LMSCONFIG sites/default/files/config_$LMSCONFIG
# chmod -r 775 sites/default/files/config_$LMSCONFIG
# echo "\$config_directories['$LMSCONFIG'] = 'sites/default/files/config_$LMSCONFIG';" >> sites/default/settings.php
SITEUUID="uuid: $(drush7 config-get system.site uuid --format=string)"

cd sites/default/files/
CONFIGDIR="$(ls -d c* | head -1)"
cd ../../../../config/$LMSCONFIG
cp -R . ../../docroot/sites/default/files/$CONFIGDIR/staging/

cd ../..
sed -i.bak "1s/.*/$SITEUUID/" docroot/sites/default/files/$CONFIGDIR/staging/system.site.yml

cd docroot/

# Following commands do not work in core beta6
# WORKAROUND: Login to website, enable config module, import staging
# drush7 en config -y
# drush7 config-import staging -y

