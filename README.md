# docker-compose-webhook

This docker image features [webhook](https://github.com/adnanh/webhook) built on top of the [docker/compose](https://hub.docker.com/r/docker/compose) image

Use to deploy a container on your docker host, upon a webhook received from your build machine.

# Usage

The container expects to find a `hooks.json` file inside `${SERVER_DIR}/config/hooks.json`

[See configuration documentation](https://github.com/adnanh/webhook/blob/master/README.md#configuration)

### Usage Example

`docker run -v "$(pwd)/my-config-dir":/server/config arikwe/docker-compose-webhook`

## Build Arguments
| Arg Name    | Description |
| ----------- | ----------- |
`SERVER_DIR`  | container working directory (defaults to `/server`)

## Environment Variables
| Var Name    | Description |
| ----------- | ----------- |
`PORT` | webhook service listening port (defaults to 9000)

