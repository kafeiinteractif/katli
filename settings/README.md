# Settings

The settings folder is a bit unique. It will provide your settings.php (and for
D8, also services.yml) file for your installation.

The values of this file will be LAYERED ON TOP OF ANY EXISTING sites/default/settings.php.

The files will be named using the following convention:

project.settings.php
project.services.yml

Inside the container these become:

sites/default/settings.php
sites/default/services.yml

...regardless of if your project already has that file or not. This will not
change your existing files at all.

## Creating these files automatically

Run "./deploy project init d7" to pre-load your Drupal 7 settings.php file.

Run "./deploy project init d8" to pre-load your Drupal 8 settings.php file and
create the services.yml file.

## Subfolders clutter

If you find that there are subfolders in here, you can safely remove those.
This occurs because Docker is trying to create a mapping and the file does not
exist. The default behavior of the mapper is to create subfolders.