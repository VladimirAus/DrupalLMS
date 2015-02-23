#!/bin/bash

mkdir modules/$1

FILEINFO="modules/$1/$1.info.yml"
echo "name: $2" >> $FILEINFO
echo "description: Example Module description." >> $FILEINFO
echo "package: Custom" >> $FILEINFO
echo "type: module" >> $FILEINFO
echo "version: 1.0" >> $FILEINFO
echo "core: 8.x" >> $FILEINFO
echo "dependencies:" >> $FILEINFO
echo "  - node" >> $FILEINFO
echo "configure: $1.admin_index" >> $FILEINFO

FILEINSTALL="modules/$1/$1.install"
echo "<?php" >> $FILEINSTALL
echo "/*" >> $FILEINSTALL
echo " * Implements hook_schema()." >> $FILEINSTALL
echo " */" >> $FILEINSTALL
echo "function foo_schema() {" >> $FILEINSTALL
echo "  $schema = array();" >> $FILEINSTALL
echo "" >> $FILEINSTALL
echo "  return $schema;" >> $FILEINSTALL
echo "}" >> $FILEINSTALL
echo "" >> $FILEINSTALL
echo "/**" >> $FILEINSTALL
echo " * Implements hook_install()." >> $FILEINSTALL
echo " */" >> $FILEINSTALL
echo "function foo_install() {" >> $FILEINSTALL
echo "  // Creates the Generic FooType entity" >> $FILEINSTALL
echo "  entity_create('foo_type', array(" >> $FILEINSTALL
echo "    'label' => 'Generic Foo type'," >> $FILEINSTALL
echo "    'type' => 'generic'," >> $FILEINSTALL
echo "    'description' => 'A very informative text goes here.'," >> $FILEINSTALL
echo "    'settings' => array('published' => 0)" >> $FILEINSTALL
echo "  ))->save();" >> $FILEINSTALL
echo "}" >> $FILEINSTALL
echo "?>" >> $FILEINSTALL

FILEMODULE="modules/$1/$1.module"
echo "<?php" >> $FILEMODULE
echo "use Drupal\Core\Language\Language;" >> $FILEMODULE
echo "use Drupal\Core\Cache\CacheBackendInterface;" >> $FILEMODULE
echo "" >> $FILEMODULE
echo "/**" >> $FILEMODULE
echo " * Implements hook_permission()." >> $FILEMODULE
echo " */" >> $FILEMODULE
echo "function $1_permission() {" >> $FILEMODULE
echo "  $permissions = array();" >> $FILEMODULE
echo "" >> $FILEMODULE
echo "  $permissions['administer $1'] = array(" >> $FILEMODULE
echo "    'title' => t('Administer $2 entity')," >> $FILEMODULE
echo "    'description' => t('Allows user to administer $2 entities.')" >> $FILEMODULE
echo "  );" >> $FILEMODULE
echo "" >> $FILEMODULE
echo "" >> $FILEMODULE
echo "  return $permissions;" >> $FILEMODULE
echo "}" >> $FILEMODULE
echo "?>" >> $FILEMODULE

FILEROUTE="modules/$1/$1.routing.yml"
echo "$1.overview:" >> $FILEROUTE
echo "  path: '/admin/structure/$1'" >> $FILEROUTE
echo "  defaults:" >> $FILEROUTE
echo "    _entity_list: '$1'" >> $FILEROUTE
echo "    _title: '$2'" >> $FILEROUTE
echo "  requirements:" >> $FILEROUTE
echo "    _permission: 'administer $1'" >> $FILEROUTE