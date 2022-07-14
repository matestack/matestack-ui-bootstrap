# Installation & Update

## Installation

Make sure to install and get to know `matestack-ui-core` first! [https://docs.matestack.io/matestack-ui-core](https://docs.matestack.io/matestack-ui-core)

Add the Ruby gem and NPM package:

```
bundle add 'matestack-ui-bootstrap'
yarn add 'matestack-ui-bootstrap'
```

Adjust the relevant application layout and add a div with the ID `matestack-ui`

`app/views/layouts/application.html.erb`

```
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

Tell Webpack to import Bootstraps CSS:

`app/javascript/packs/stylesheets/application.scss`

```css
@import "~bootstrap/scss/bootstrap.scss";
```

Import the required JS libraries and mount MatestackUiCore and MatestackUiBootstrap properly. We recommend to remove Turbolinks, as it might interfere with some of the reactivity feature of Matestack:

`app/javascript/packs/application.js`

```javascript
import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "./stylesheets/application.scss";

import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'

import MatestackUiCore from 'matestack-ui-core'
import MatestackUiBootstrap from "matestack-ui-bootstrap"

let matestackUiApp = undefined

document.addEventListener('DOMContentLoaded', () => {
  matestackUiApp = new Vue({
    el: "#matestack-ui",
    store: MatestackUiCore.store
  })
})

Rails.start()
// Turbolinks.start()
ActiveStorage.start()
```

Download and import Bootstraps icons:

`app/assets/images/icons`

* download latest compatible icons: [https://github.com/twbs/icons/releases/tag/v1.3.0](https://github.com/twbs/icons/releases/tag/v1.3.0)
* extract the bootstrap-icons.svg to this path: app/assets/images/icons (currently served via assets pipeline, we had issues serving the icons via Webpack)

and finally compile the code with webpack:

```
$ bin/webpack --watch
```

{% hint style="warning" %}
When you update the `matestack-ui-bootstrap` Ruby gem, make sure to update the npm package as well!
{% endhint %}

## Update

### Ruby Gem

Depending on the entry in your Gemfile, you might need to adjust the allowed version ranges in order to update the Gem. After checked and adjusted the version ranges, run:

```bash
bundle update matestack-ui-bootstrap
```

and then check the installed version:

```bash
bundle info matestack-ui-bootstrap
```

### JavaScript Package

If you've installed the JavaScript dependecies via Yarn/Webpacker you need to update the JavaScript assets via yarn:

```bash
yarn upgrade matestack-ui-bootstrap
```

{% hint style="info" %}
No need to specify a version in your package.json.\
\
matestack-ui-bootstrap's version is automatically picked up to be compatible with the installed matestack-ui-core version.
{% endhint %}

and finally check if the correct version is installed:

```bash
yarn list --pattern "matestack-ui-bootstrap"
```

{% hint style="warning" %}
The Ruby gem version and the NPM package version should match!
{% endhint %}
