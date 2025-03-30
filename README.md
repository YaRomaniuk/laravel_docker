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

make build
make artisan key:generate
make artisan migrate
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

**User**: `laravel`
**Password**: `laravel`
**Database**: `laravel`
**Host**: `mysql`

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

## Vite

`make npm run dev` - live compile css, js
`make npm run build` - create public css, js
