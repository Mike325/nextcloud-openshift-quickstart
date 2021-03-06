#/bin/bash
# -*- ENCODING: UTF-8 -*-

echo "  ---> Removing .git dir"
rm -fr .git

# Creating app
echo "  ---> Creating nexcloud instance"
rhc app create nextcloud php-5.4 mysql-5.5 cron-1.4 -s

if [[ ! -d nextcloud ]]; then
    echo "  ---> Getting repo"
    rhc git-clone nextcloud
fi

echo "  ---> Removing default php configurations"
rm nextcloud/index.php
rm -rf nextcloud/.openshift

# Coping data to app
echo "  ---> Copying base service"
mv .openshift nextcloud/
mv php nextcloud/

echo "  ---> Deploying nextcloud to openshift"
cd nextcloud
git add -A && git commit -m "init nextcloud" && git push
