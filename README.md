```
$ git clone https://git.drupalcode.org/project/drupal.git --branch 7.77 --single-branch

$ cp -rf drupal/* . && \
  cp drupal/.editorconfig . && \
  cp drupal/.gitignore . && \
  cp drupal/.htaccess .

$ rm -rf web.config \
  modules/php \
  modules/aggregator \
  modules/blog \
  modules/book \
  modules/color \
  modules/contact \
  modules/translation \
  modules/dashboard \
  modules/forum \
  modules/locale \
  modules/openid \
  modules/overlay \
  modules/poll \
  modules/rdf \
  modules/search \
  modules/statistics\
   modules/toolbar \
  modules/tracker \
  modules/trigger \
  drupal

$ git apply patches/2789723-1.patch && \
  git apply patches/d7-require-tld-for-mailto-links-2016739-76.patch && \
  git apply patches/watchdog_pending_updates.patch

$ git add *
$ git status
$ git commit -m 'Hardened 7.77 core.'
$ git push -u origin feature/1
```
