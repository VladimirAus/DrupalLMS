# Project Lantern - Drupal 8 Headless
Headless Drupal 8 distribution.

### Version
0.0.2

### Installation & deployment


##### Backend

```sh
$ sudo bash -x bin/d8.back.deploy.sh
```
Steps:
* Downloads latest version (dev) of Drupal 8 based on make file into docroot folder.
* Installs minimal profiles.
* Imports yml configuration files.

Note, change settings (database, LAMP, login) in sh script prior to execution.

Note, point your domain to docroot folder.

##### Front

To install (to run once): 
```sh
$ cd frontang/
$ npm install && bower install
```

To update: 
```sh
$ sudo bash -x bin/d8.front.deploy.sh
```
Steps:
* Compiles application into frontang/dist folder based on Grunt settings.
* Moves frontang/dist to docroot/dist 

Note, [yeoman angular+require] is not working properly

### Project Structure

* config - configuration files
* bin - helper scripts
* frontang - development forlder of frontend based on [yeoman angular]

### Requirements

To install frontend you need:

* [nodeJS]
* [Bower]
* [Grunt]
* [Yeoman]

To install backend you need:

* Drush (version 7)
* LAMP stack



License
----

GNU


**Free Software, Hell Yeah!**

[Drupal 8]:http://www.drupal.org/
[nodeJS]:https://docs.npmjs.com/getting-started/installing-node
[Bower]:http://bower.io/#install-bower
[Grunt]:http://gruntjs.com/
[Yeoman]:http://yeoman.io/
[yeoman angular]:https://github.com/aaronallport/generator-angular
[yeoman angular+require]:https://github.com/aaronallport/generator-angular-require