# Factorio Server Dockerized

This repository hosts a simple pre-built Docker image to set up a multiplayer server for [Factorio](https://www.factorio.com).

It builds the latest version every day, so when a new version of factorio is released, it should be available in the next 24h in worst case.

## Usage

If you want to start the container using the Docker CLI, you can use the following commands.

```
$ mkdir -p factorio/{mods,save}
$ docker pull ghcr.io/zekrotja/factorio:latest
$ docker run \
    --name factorio \
    -p 34197:34197/udp \
    -v $PWD/factorio/save:/var/save \
    -v $PWD/factorio/mods:/var/mods:ro \
    ghcr.io/zekrotja/factorio:latest
```

Or, when you want to use the provided `docker-compose.yml`, download it and run the stack.

```
$ curl -Lo docker-compose.yml \
    https://raw.githubusercontent.com/zekroTJA/factorio-docker/master/docker-compose.yml
$ docker-compose up -d
```

## Saves

When you do not put a save file in the mounted `save` (`/var/save` mount) volume, a new game save is created. If you want, you can pass [parameters](https://wiki.factorio.com/Command_line_parameters) to the game creation process using the `CREATE_ARGS` evnironment vaiable.

Otherwise, you can put your save file in the `save` directory. The first file in this directory is then loaded on server startup.

## Mods

You can also inject your mods you want to paly with by mounting `/var/mods` and placing your mod archives with the `mod-list.json` and `mod-settings.dat` into it.

## Server Configuration

You can also pass custom command arguments to the container using the `cmd` parameter. For example, you can pass a custom server configuration file as following.

```
$ docker run \
    --name factorio \
    -p 34197:34197/udp \
    -v $PWD/factorio/save:/var/save \
    -v $PWD/factorio/mods:/var/mods:ro \
    -v $PWD/factorio/server-settings.json:/var/config/server-settings.json:ro \
    ghcr.io/zekrotja/factorio:latest \
        --server-settings /var/config/server-settings.json
```

You can also specify custom locations for ban or white lists by passing [parameters](https://wiki.factorio.com/Command_line_parameters) and binding the specific paths to volumes.