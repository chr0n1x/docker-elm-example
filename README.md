docker-elm-example
====

Playing around with elm in docker.

Containers based on [codesimple/elm](https://hub.docker.com/r/codesimple/elm/)

# Prerequisites

- [docker](https://www.docker.com/products/overview) should be installed

...yup, that's really it. Well, you might need an editor.

# Running

## `make build`

Creates the image, adding the src files into a container. Tags it as `chr0n1x/docker-elm-example:latest` and whatever `HEAD` SHA is.

## `make dev-cli`

Mounts all code into the [codesimple/elm](https://hub.docker.com/r/codesimple/elm/) container. You directly have access to all of the `elm` tools from here.

## `make dev-server`

Mounts all code in, starts the server: `elm-reactor --address 0.0.0.0`
Allows you to then edit code on your host and just reload the browser (e.g.: `127.0.0.1:8000`) to view your changes.
