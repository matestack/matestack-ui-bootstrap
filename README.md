# Matestack Ui Bootstrap

**Docs and specs in progress, please wait for official release announcement before using this gem** 

## Usage

### Webpacker Installation

```shell
bundle add 'matestack-ui-bootstrap'
yarn add 'matestack-ui-bootstrap'
```

`app/views/layouts/application.html.erb`
```erb
<!DOCTYPE html>
<html>
  <head>
    <title>Your App</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag 'application', media: 'all'%>
    <%= javascript_pack_tag 'application'%>
  </head>

  <body>
    <div id="matestack-ui">
      <%= yield %>
    </div>
  </body>
</html>

```

`app/javascript/packs/stylesheets/application.scss`
```scss
@import "~bootstrap/scss/bootstrap.scss";
```

`app/javascript/packs/application.js`
```javascript
import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "./stylesheets/application.scss";

import MatestackUiCore from "matestack-ui-core"
import MatestackUiBootstrap from "matestack-ui-bootstrap"

Rails.start()
// Turbolinks.start()
ActiveStorage.start()
```

`app/assets/images/icons`

- download latest compatible icons: https://github.com/twbs/icons/releases/tag/v1.3.0
- extract the bootstrap-icons.svg to this path: app/assets/images/icons (server via assets pipeline)


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

## Release

```shell
docker-compose run --rm builder
gem bump ...
gem release
npm bump ...
npm release
git tag ...
```
