# SRB2-Docker

Docker compose for running a Sonic Robo Blast 2 dedicated server.

## Usage

### Basic

I prefer to use docker compose, so I've included the docker-compose.yaml file. Here is an example of how to run this container:

1. ```git clone https://github.com/Mintmd2/SRB2-Docker.git```
2. ```cd SRB2-Docker```
3. ```nano docker-compose.yaml``` Edit this file to your liking - i.e. addons, server config...
4. ```docker compose up -d```

Wait for the container to be built, and you'll be left with the stack 'SRB2' running in Docker. The console output will give you any and all important info regarding your dedicated server.

#### Requirements

This container *requires* **music.pk3**, **characters.pk3**, **srb2.pk3** and **zones.pk3** in the same directory as the Dockerfile. These can simply be copied over from an already existing installion of SRB2.

### Advanced

#### Configuration

For the server to save configuration data, bind the `/config` volume to a host directory.\
In order to configure server variables, create `adedserv.cfg`, and edit it. Documentation [here](https://wiki.srb2.org/wiki/Console/Variables#Server_options) at the SRB2 Wiki. This will allow you to change the Servername or add a admin password.

#### Addons

In order to load addons, bind the `/addons` volume to a host directory. The server should load them automatically the next time the container is created.
