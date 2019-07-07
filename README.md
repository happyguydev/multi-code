# Docker development environment
After firing up the docker containers:
The front-end is located at http://localhost:4200
The api is located at http://localhost/api/v1

# Known issues
Since http://localhost:4200 and localhost are two different base routes, you'll run into issues when the frontend is trying to access the API.
Please enable CORS in your browser
https://en.wikipedia.org/wiki/Cross-origin_resource_sharing

## Common Tasks

### Start
To start the development environment entirely, run:
`docker-compose build` => to prepare the volumes for the environment
`docker-compose up -d` => to fire up the actual machines

### View logs
To view logs from all containers, run `docker-compose logs -f`.
To view logs from a single container, run `docker-compose logs -f php`. (or mssql, or node, or sqlcmd)

### Stop
To stop the development environment, run `docker-compose down`.

### To Update
If container image configs are updated, OR if you need to reset your database you'll need to rebuild. After
the first time, it runs quickly.
Populated version: `docker-compose build`.

### Run Command in Container
`docker-compose exec [container name] [command]`

For example, to open a shell in the webserver container (like SSH) :
`docker-compose exec php bash`

Or to run phpstan tests (docker/php/tests.sh)
`docker-compose exec php runtest`

Or to run phpstan
'docker-compose exec php php vendor/bin/phpstan analyse --configuration=phpstan.neon --level=max src mvc-php settings language management'

Note: the first "php" after exec is the machine name, the second "php" is the
actual executable name

## First Time setup
1. Create a folder ~/developer/zf-mc
2. `git clone --recurse-submodules https://bitbucket.org/marianteam/zf-mc-docker.git`
3. `cd zf-mc-docker`

4.  Assuming you want to work with branch "develop". Otherwise, follow your feature-branch in all submodules
    checkout develop
    cd api | checkout develop | cd..
    cd frontend | checkout develop | cd..
    cd sql | checkout develop | cd..

    e.g. replace "develop" with your feature branch. Contact the repo owner if you need more details

4. copy sample.env to .env and update the base path to the zf-mc-docker folder (e.g. ~/developer/hb/zf-mc-docker)
5. `docker-compose build`
6. `docker-compose up`
7. http://localhost:4200
8. http://localhost/... (info TBD)

## Installing Docker

### Linux
Install docker using normal methods.
Typically `curl https://get.docker.com/ | bash` works well for me - other methods should work fine as well.
Ensure you also install docker-compose, which is a seperate tool.

### Windows
https://store.docker.com/editions/community/docker-ce-desktop-windows?ref=login

# ensure the new machine is running
docker-machine ls

# Test the new machine
docker run hello-world
```

## Windows 7 / Windows 10
1. If you are on Windows 7 / 10, open sample.env and follow instructions there. You will need to specify the local path to the repo

2. Open Docker Settings \ Shared Drives and check the drive where the repo resides.
3. During the docker installation, make sure to configure docker using Linux containers, not Windows containers.
If you missed that you have the option to reconfigure: open the Docker taskbar menu and select "Switch to Linux containers"


Note that there are multiple ways to install docker on windows and mac, you may find it useful to use some of the other methods available.

## Docker Cleanup
https://docs.docker.com/config/pruning/

to prunes images, containers, and networks
$ docker system prune

if you want to also prune volumes, add the --volumes flag:
$ docker system prune --volumes