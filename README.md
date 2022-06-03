# Local Development

If you run into any issues please contact me.

## Requirements

- [Docker](https://docs.docker.com/engine/install/)
- [Docker compose](https://docs.docker.com/compose/install/)

## Inital setup

- Open the project directory
- Build the docker image
  - `docker compose build`
- If you need to run any command inside the container
  - `docker compose run --rm web rails db:create` # to create a database
  - `docker compose run --rm web bundle install` # to install ruby gems
  - `docker compose run --rm web yarn` # to update javascript deps

## Spin up the project

- Run docker image
  - `docker compose up`

_It will automatically listen to any changes in the code (css, javascript included)_