readonly DVER="8.0.0-beta6"
readonly SITENAME="lms.drupal8.loc" 
readonly DBNAME="lms_drupal8_loc"

readonly DBSERVER="localhost"
readonly DBLOGIN="root"
readonly DBPSWD="root"

readonly DRUPLOGIN="admin"
readonly DRUPPSWD="password"

readonly DBCONN="mysql://$DBLOGIN:$DBPSWD@$DBSERVER/$DBNAME"

cd /Applications/MAMP/htdocs/_SITES/
drush7 dl drupal-8
mv drupal-$DVER $SITENAME
cd $SITENAME

sudo bash -x ~/bin/host/mamp_new_host.sh $SITENAME

drush7 sql-create --db-url="$DBCONN" --yes
drush7 si minimal --db-url="$DBCONN" --account-name=$DRUPLOGIN --account-pass=$DRUPPSWD --yes
drush7 si standard --db-url="$DBCONN" --account-name=$DRUPLOGIN --account-pass=$DRUPPSWD --yes