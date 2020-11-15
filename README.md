# Matestack Ui Bootstrap

## Development

To set up this project, run those three commands:

```shell
bundle install
yarn install
rake db:setup
```

Afterwards, you need to run both

```shell
rails s
```

and

```shell
./bin/webpack --watch
```

simultaneously to be able to visit the demo app on [localhost:3000](localhost:3000).

## Testing

To run the tests, make sure you have the webpack dev-server running via

```shell
./bin/webpack --watch
```

Then, you can run the tests via

```shell
bundle exec rspec spec
```
