#/bin/bash
# -*- ENCODING: UTF-8 -*-

rm -fr .git

# Creating app
rhc app create nextcloud php-5.4 mysql-5.5 cron-1.4 -s

rm nextcloud/index.php
# Coping data to app
rm -rf nextcloud/.openshift && mv .openshift nextcloud/
mv php nextcloud/
cd nextcloud

git add -A && git commit -m "init nextcloud" && git push
