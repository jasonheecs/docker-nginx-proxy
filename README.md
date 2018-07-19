# Modified Docker Image for nginx-proxy

A modified docker image based on the [nginx-proxy](https://github.com/jwilder/nginx-proxy) docker image. Increased nginx upload limts and removed nginx server tokens.

## Usage

`docker pull jasonheecs/nginx-proxy:latest`

Sample `docker-compose` file:

```
version: '2'
services:
  nginx-proxy:  
    image: jasonheecs/nginx-proxy
    ports:
      - "80:80"
    volumes:
      - /var/run/docker.sock:/tmp/docker.sock
    container_name: nginx-proxy
```

## Testing
Testing is done via Rspec and Hadolint

To run Rspec tests:
```bash
gem install bundler
bundle install
bundle exec rspec
```

To run linting tests on the Dockerfile:
```bash
docker pull hadolint/hadolint
docker run --rm -i hadolint/hadolint < Dockerfile
```

Refer to the [travis.yml](.travis.yml) file and [Travis build logs][travis-link] for details on the automated tests and expected outputs.

## License
MIT
