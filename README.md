# Katli


Katli is a Drupal-ready Docker environment that you can use to spin up local
sites using the latest Docker tools. It presumes very little about your repo,
and it can run on your local machine or in a server environment if you prefer
to develop in the cloud.

## Installation

#### 1. Install docker and docker-compose.

On Linux these must be installed separately, but on Mac and Windows they will
be installed together as part of Docker Toolbox if you use that installer.

If you are running natively on Linux you can access the boxes by IP address.

Using Mac or Windows you will need the IP of the docker-machine or boot2docker
image and the port number. The 'si' and 'db' commands will output the relevant
info to get you started.

#### 2. Build the two php docker images.

We will eventually publish these to Dockerhub so that this step will not be necessary.

Until then run these from the katli folder as root:
`cd src/d7p7 && docker build -t 'kafei/d7p7' .`
Followed by:
`cd src/d7p56 && docker build -t 'kafei/d7p56' .`

#### 3. Create a project under /repos

You can clone your git repo under the "repos" folder, or use SVN, CVS, or
whatever version control you are familiar with.

It is recommended to run `./deploy project new` ... where "project" is the name
of your project. This creates the necessary files structure for you, including
your repos/project folder. Once that is done you will probably want a
settings.php configuration, but it is optional. Read the next section for
details on that.

Be sure to give your project a short name that you will be comfortable typing a
lot.

NOTE: the name you give to the repos/project folder will be the same name as
your database imports, files directory, etc.

#### 4. Configure database. If importing a database, put that in the /sql folder.

The file will be called project.sql.gz (and yes, it must be gzipped).

As an option you may also provide project_legacy.sql.gz (this will be useful if
you plan on doing migrations).

To populate the project.settings.php file do this:

`./deploy project init d7` or:

`./deploy project init d8`

Database defaults are as follows:

Database name: project
User: root
Password: my-secret-pw (configurable... see below)
Host: db

Database name: project_legacy
User: root
Password: my-secret-pw
Host: db

Note: project is also the name of your repo, files folder, and project.settings.php, etc...

#### 5. Now start your environment!

`COMPOSE_PROJECT_NAME=project docker-compose up`

This will boot up three docker containers: one for the DB, another for php7,
and one for php5.6.

Once that is done you can now use the `./deploy project` command to get a
console at the docroot. Drush and Drupal Console are pre-installed.

#### 6. Use the force.

`./deploy project init d7` (or d8)

This will try to create a settings.php for your project. You can create one
yourself as project.settings.php (and project.services.yml for Drupal8 sites).

`./deploy project si`

This will install Drupal using the standard profile. Sometimes this can be
useful if you wish to create a custom settings.php file yourself rather than
using the `./deploy init` command.

Upon completion it will give you login information and drop you into a console
to begin working.

`./deploy project db`

This command will load both project.sql.gz and project_legacy.sql.gz from the
sql database into MySQL databases of the same name.

If no project_legacy.sql.gz file is present it will be skipped.

Upon completion it will give you login information and drop you into a console
to begin working.

`./deploy project xx`

This command deletes the database. Very useful if you are debugging and need to
be certain that you are starting completely from scratch.

`./deploy project`

This will give you a console to run `drush` and `drupal` console commands.

Note: si and db commands automatically log you into a console.

#### 7. Customize.

You may want to do things like change the root password for MySQL.

The password is set to my-secret-db by default and it exists in two places in
the configuration:

- in docker-compose.yml
- in deploy at the top of the file

After doing so you may need to shut down your docker-compose instance with the
following:

`COMPOSE_PROJECT_NAME=project docker-compose stop`

Followed by deleting the image which contains your DB:

`docker rm project_db_1`

Then you can restart things again. The DB will take about 30-60 seconds to
initialize again (and it will be empty).

Note: we did not set the root password to be optional as this restricts the use
of root to 'localhost', but the DB in this case is on a separate box that is
called 'db' to the eyes of Drupal.

## Support

Create an issue in the Github project.

We use this internally and we intend for it to be a lightweight implementation
so keep that in mind. If you want to do an ambitious rebuild, go for it.

## About

This project was inspired by a similar (but much more complex) deployment
system used by one of our clients. We wanted a lighter solution for our other
projects.

The word Katli means "slice". It is used in the name of our favorite Indian
sweet: Kaju Katli (cachew slices). Hopefully you will enjoy this little slice
of Docker!

Author of this project is Ryan Weal of Kafei Interactive Inc. (Canada).

## Other Projects

If you want a gui-based solution consider Kalabox https://github.com/kalabox/kalabox

Deeper down the rabbit hole? Try https://github.com/blinkreaction/drude
