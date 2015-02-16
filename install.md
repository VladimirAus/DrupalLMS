#D8B6
### Prerequisites
* Drush (version 7)
* LAMP stack
* Drupal 8

### Project intallation
### Repo
Clone eeLMS repo into your _SITES directory

```sh
$ cd path/to/doc/root/_SITES
$ git clone https://github.com/VladimirAus/DrupalLMS
```
### Configuration
Update configuration variables in bin/lms.d8.install.with-config.sh with your drupal site name, admin account, etc

NOTE: If you don't have DB uncomment line 26 in lms.d8.install.with-config.sh or
create DB by running
```sh
#drush sql-create --db-url="mysql://admin_user:admin_password@your_server/new_db" --yes
```

Run Drupal 8 installation site installation 

```sh
sudo bash -x bin/lms.d8.install.with-config.sh
```
Drupal 8 will be downloaded and installed, configuration is downloaded

### Manual Steps
Current Drush does not support Drupal 8 configuration import, therefore these manual steps are nessessary for configuration import:

Open and login into your new drupal site http://lms.drupal8.loc/

Enable module of configuration manager in http://lms.drupal8.loc/admin/modules

Navigate to site's configuration manager Manage -> Configuration -> Development -> Configuration Manager or http://lms.drupal8.loc/admin/config/development/configuration

Select Single Import/Export  tab

Select Export tab

Set Configuration Type to Simple configuration, Configuration Name to system.site, configuration will appea in the text area, copy all text from text area, eg

```sh
uuid: 16f7ffa9-02e1-4290-8c00-f1a59d4a912d
name: Site-Install
mail: admin@example.com
slogan: ''
page:
  403: ''
  404: ''
  front: user/login
admin_compact_mode: false
weight_select_max: 100
langcode: en
```

Select Import tab

Set Configuration type to Simple configuration, Configuration Name to system.site, insert exported configuration value

Replace uuid with uuid value from /DrupalLMS/docroot/sites/default/files/config_XXX/staging/system.site.yml

Click Import

### DONE