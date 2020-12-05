# CU-Web-Express Visual Studio Code Setup (for Macs)

The settings.json file in the .vscode directory sets useful workspace settings for a helpful developer experience with our codebase. In order for these settings to take effect you will need to install some vscode extensions. This is very easy, do not worry. Just click the icon in the left sidebar that looks like four little squares with the upper left one not touching the others and search for them. If that icon is not there just google "install vscode extensions" or something similar.

## VSCode extensions to install
### In order for linting php code according to Drupal standards:
1. phpcs by Ioannis Kappas
2. phpcbf by Per Soderlind
3. PHP DocBlocker by Neil Brayfield
4. empty-indent by DmitriDorofeev

### other useful extensions:
1. PHP IntelliSense by Felix Becker
2. PHP Debug by Felix Becker

## Debugging with XDebug
We mostly use Lando for local Drupal development and in order to use VSCode's debugger you will need to do a couple more things (assuming you have installed the PHP Debug extension):

1. In the .lando.yml file, make sure that, under `appserver:`, you have the following:
    - `xdebug: true
      config:
        php: .vscode/php.ini`
2. run `lando rebuild` to make the changes in .lando.yml take effect

## get phpcs and phpcbf to work
1. run `composer install` to install the needed code dependencies
2. run `./vendor/bin/phpcs --config-set <pathToProjectDirectory>/vendor/drupal/coder/coder_sniffer`
3. run `./vendor/bin/phpcs -i` => You should see Drupal and DrupalPractice listed in the output.
4. apply a patch that should give the phpcs extension the ability to scan .install, .module, and many other Drupal 7 related file types
    1. run `mv .vscode/ikappas-vscode-phpcs-pullr-172-1.patch ~/.vscode/extensions/ikappas.phpcs-1.0.5/`
    2. run `cd ~/.vscode/extensions/ikappas.phpcs-1.0.5/`
    2. run `git apply ikappas-vscode-phpcs-pullr-172-1.patch`
5. restart Visual Studio Code.

Hopefully everything works! If not ask around or google a ton!
