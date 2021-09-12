# srb2

Docker-compose for running a Sonic Robo Blast 2 dedicated server.

*NOTE - I am pretty inexperienced with Dockerfile so it likely isn't using best practices. Though it works great for me, use at your own risk.*

## Usage

### Basic

I prefer to use docker-compose, so I've included the docker-compose.yml file. Edit this file to your liking, then 'cd' into the directory and use 'docker-compose up -d'. The container should be built, and you'll be left with the stack 'SRB2' running in Docker. The console output will give you any and all important info regarding your dedicated server.

This container **requires** 'models.dat', 'patch.pk3', 'patch_music.pk3', 'player.dta', 'srb2.pk3' and 'zones.pk3' in the same directory as the Dockerfile. These can simply be copied over from an already existing installion of SRB2.

### Advanced

#### Configuration

In order to configure server variables, bind the `/config` volume to a host directory, create `adedserv.cfg`, and edit it. Documentation [here](https://wiki.srb2.org/wiki/Console/Variables#Server_options).

#### Addons

In order to load addons, bind the `/addons` volume to a host directory. The server should load them automatically the next time the container is created.

## Credit

Huge thank you to https://github.com/BrianAllred/srb2kart. I wouldn't have been able to make this without their hard work.
