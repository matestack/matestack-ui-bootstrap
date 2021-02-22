# Matestack Ui Bootstrap

**Docs and specs in progress, please wait for official release announcement before using this gem**

## Development

### Dummy App

**initial setup**

```shell
docker-compose build dummy
docker-compose run --rm dummy bash
```

inside container:

```shell
bundle install
yarn install
cd spec/dummy
bundle install
npm install (npm and not yarn!)
rails app:db:setup
```

**dummy app start**

on your host:
```shell
docker-compose up dummy
```

and

```shell
docker-compose run --rm dummy sh -c "cd spec/dummy && ./bin/webpack --watch"
```

simultaneously to be able to visit the demo app on [localhost:3000](localhost:3000).

## Testing

**initial setup**

```shell
docker-compose build dummy
docker-compose run --rm dummy bash
```

inside container:

```shell
bundle install
yarn install
cd spec/dummy
bundle install
npm install (npm and not yarn!)
rails app:db:setup
```

**test run**

```shell
docker-compose run --rm builder bash

```

inside container:

```shell
bundle exec rspec spec/test
```

## Release

```shell
docker-compose run --rm builder
gem bump ...
gem release
npm bump ...
npm release
git tag ...
```
