# Project Lantern - Drupal 8 LMS
Learning Management System (LMS) based on [Drupal 8]. Main features include

  - Student, teacher, school user types
  - Course management
  - Quiz management

### Version
0.0.2

### Installation

#### Current Drupal 8 dev (version > beta 6)

```sh
$ sudo bash -x bin/lms.d8.install.with-config.sh
```

The command will create docroot folder with Drupal 8 installed in it and will import the settings.

#### Drupal 8 beta 6 and lower

[Installation Instructions for Drupal 8 beta]

### Project Structure

* config - configuration files
* bin - helper scripts

### Requirements

To install eeLMS you need:

* Drush (version 7)
* LAMP stack


### Todo's

 - Auto import
 - Basic course structure

License
----

MIT


**Free Software, Hell Yeah!**

[Drupal 8]:http://www.drupal.org/
[Installation Instructions for Drupal 8 beta]:https://github.com/VladimirAus/DrupalLMS/blob/master/install.md
