Nextcloud on OpenShift
=========================

Nextcloud is a flexible, open source file sync and share solution. Whether using a mobile device, a workstation, or a web client, Nextcloud provides the ability to put the right files at their employees’ fingertips on any device in one simple-to-use, secure, private and controlled solution.

Think of Nextcloud as a way to roll your own Google Drive or Dropbox on-premise solution.

More information can be found at http://nextcloud.org/

Running on OpenShift
--------------------

Create an account at https://www.openshift.com

Create a PHP application with a MySQL cartridge:

	rhc app create nextcloud php-5.4 mysql-5.5 cron-1.4

or with PostgreSQL cartridge:

	rhc app create nextcloud php-5.4 postgresql-9.2 cron-1.4

Add this upstream Nextcloud quickstart repo

	cd nextcloud
	git remote add upstream -m master git://github.com/mike325/nextcloud-openshift-quickstart.git
	git pull -s recursive -X theirs upstream master

Push back to your OpenShift repo

	git push        

Head to your application at:

	http://nextcloud-$yourdomain.rhcloud.com

Default Credentials
-------------------

The default user is 'admin' and the password should be printed out to console
after deployment. Please change the default password after first login.

To download clients that will sync your Nextcloud instance with desktop clients, visit http://nextcloud.org/sync-clients/

To give your new Nextcloud site a web address of its own, add your desired alias:

	rhc app add-alias -a nextcloud --alias "$whatever.$mydomain.com"

Then add a cname entry in your domain's dns configuration pointing your alias to $whatever-$yourdomain.rhcloud.com.
