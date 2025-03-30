# Database X

Based on https://github.com/aschmelyun/docker-compose-laravel/tree/main

## Requirement

* [Docker](https://hub.docker.com/)
* [Make command](https://gist.github.com/evanwill/0207876c3243bbb6863e65ec5dc3f058#make) ( For windows )

## Usage

Write to hosts file

```bash
#dev.free_broker.ru
127.0.0.1 dev.database-x.ru
```

```bash
git clone https://gitlab.com/____
cd <project-name>

```

## Links

* gitlab:   <https://gitlab.com/finlead/brokers/dev/free-broker>
* dev copy: http://dev.free_broker.ru
* database: http://dev.free_broker.ru:8085

## Credentials

MySQL root:

**User**: `root`
**Password**: `password`

MySQL access:

**User**: `wordpress`
**Password**: `wordpress`
**Database**: `wordpress`
**Host**: `mariadb`

## Directory Structure

* `www` - The web root of your web application.

## Commands

`make help` - Print commands help.
`make up` - Start containers.
`make down` - Stop containers.
`make start` - Start containers without updating.
`make stop` - Stop containers.
`make shell` - Access `php` container via shell.
`make wp` - Executes `wp cli` command in a specified `WP_ROOT` directory (default is `/var/www/html/`).

## Gulp

`npm run build` - compile scss, minify css, minify js for brokers and plugins from gulpconfig.js,
`npm run build -- --template={broker_template}` - compile scss, minify css, minify js for broker,
`npm run build -- --plugin={plugin_directory_name}` - minify css, minify js for plugin.
