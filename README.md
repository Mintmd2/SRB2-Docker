# srb2

Docker container for running a Sonic Robo Blast 2 dedicated server.

**NOTE - I am pretty inexperienced with Dockerfile so it likely isn't using best practices. Though it works great for me, use at your own risk.**

## Usage

### Basic

I prefer to use docker-compose, so I've included the docker-compose.yml file. Edit this file to your liking, then 'cd' into the directory and use 'docker-compose up -d'. The container should be built, and you'll be left with the stack 'SRB2' running in Docker. The console output will give you any and all important info regarding your dedicated server.

### Advanced

#### Configuration

In order to configure server variables, bind the `/config` volume to a host directory, create `adedserv.cfg`, and edit it. Documentation [here](https://wiki.srb2.org/wiki/Console/Variables#Server_options).

#### Addons

In order to load addons, place them in the addon directory. The server should load them automatically the next time the container is created.


## Credit

Huge thank you to https://github.com/BrianAllred/srb2kart. I wouldn't have been able to make this without their hard work.