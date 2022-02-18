#!/bin/bash

if [ -z "$1"]
then
  echo "add the drupal version number when starting this script. 'bash ./update-script.sh 7.XX'"

else
  echo "getting Drupal $1 core code ..."
  # git clone https://git.drupalcode.org/project/drupal.git --branch $1 --single-branch

  cp -rf drupal/* .
  cp drupal/.editorconfig .
  cp drupal/.gitignore .
  cp drupal/.htaccess .

  rm -rf web.config
  rm -rf modules/php
  rm -rf modules/aggregator
  rm -rf modules/blog
  rm -rf modules/book
  rm -rf modules/color
  rm -rf modules/contact
  rm -rf modules/translation
  rm -rf modules/dashboard
  rm -rf modules/forum
  rm -rf modules/locale
  rm -rf modules/openid
  rm -rf modules/overlay
  rm -rf modules/poll
  rm -rf modules/rdf
  rm -rf modules/search
  rm -rf modules/statistics
  rm -rf modules/toolbar
  rm -rf modules/tracker
  rm -rf modules/trigger
  rm -rf drupal

  # "if" you need to add these patches try un-commenting these lines
  # git apply patches/2789723-1.patch
  # git apply patches/d7-require-tld-for-mailto-links-2016739-76.patch
  # git apply patches/watchdog_pending_updates.patch

  git add *
  git status
  git commit -m "Hardened $1 core."
  git push -u origin feature/$1
fi