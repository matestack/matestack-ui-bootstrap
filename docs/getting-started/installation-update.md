# Installation & Update

## Installation

Make sure to install and get to know `matestack-ui-core` and `matestack-ui-vuejs` first!

- [https://docs.matestack.io/matestack-ui-core](https://docs.matestack.io/matestack-ui-core)
- [https://docs.matestack.io/matestack-ui-vuejs](https://docs.matestack.io/matestack-ui-vuejs)

## Installation

Add 'matestack-ui-bootstrap' to your Gemfile

```ruby
gem 'matestack-ui-bootstrap', "~> 3.0.0.rc1"
```

and run

```
$ bundle install
```

### Matestack Ui Core/VueJs install steps (if not already happened)

Create a folder called 'matestack' in your app directory. All your Matestack apps, pages and components will be defined there.

```
$ mkdir app/matestack
```

Add the Matestack helper to your controllers. If you want to make the helpers available in all controllers, add it to your 'ApplicationController' this way:

`app/controllers/application_controller.rb`

```ruby
class ApplicationController < ActionController::Base
  include Matestack::Ui::Core::Helper
  #...
end
```

You need to add the ID "matestack-ui" to some part of your application layout (or any layout you use). That's required for Matestack's Vue.js to work properly!

For Example, your `app/views/layouts/application.html.erb` should look like this:

```markup
<!DOCTYPE html>
<html>
  <head>
    <title>My App</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag    'application', media: 'all' %>

    <!-- if you are using webpacker: -->
    <%= javascript_pack_tag 'application' %>

    <!-- if you are using the asset pipeline: -->
    <%= javascript_include_tag 'application' %>
  </head>

  <body>
    <div id="matestack-ui">
      <%= yield %>
    </div>
  </body>
</html>
```

{% hint style="warning" %}
Don't apply the "matestack-ui" id to the body tag.
{% endhint %}

### JavaScript installation

#### Rails 7 importmap based installation

will be shipped in `matestack-ui-bootstrap` `3.1`

#### Webpacker > 5.x based JavaScript installation

Add 'matestack-ui-vuejs' to your `package.json` by running:

```
$ yarn add matestack-ui-bootstrap@3.0.0-rc1
```

This adds the npm package that provides the JavaScript corresponding to the matestack-ui-bootstrap Ruby gem. Make sure that the npm package version matches the gem version. To find out what gem version you are using, you may use `bundle info matestack-ui-bootstrap`.

**Note**:

* vue3 dropped IE 11 support
* when using babel alongside webpacker, please adjust your package.json or .browserslistrc config in order to exclude IE 11 support:

```json
{
  "name": "my-app",
  "...": { },
  "browserslist": [
    "defaults",
    "not IE 11" // <-- important!
  ]
}
```

Otherwise you may encounter issues around `regeneratorRuntime` (especially when using Vuex)

Next, import and setup 'matestack-ui-vuejs' in your `app/javascript/packs/application.js`

```javascript
import { createApp } from 'vue'
import MatestackUiVueJs from 'matestack-ui-vuejs'

import MatestackUiBootstrap from 'matestack-ui-bootstrap' // add this

const appInstance = createApp({})

MatestackUiBootstrap.registerComponents(appInstance) // add this

document.addEventListener('DOMContentLoaded', () => {
  MatestackUiVueJs.mount(appInstance)
})
```

and properly configure webpack:

`config/webpack/environment.js`

```javascript
const { environment } = require('@rails/webpacker')
const webpack = require('webpack');

const customWebpackConfig = {
  resolve: {
    alias: {
      vue: 'vue/dist/vue.esm-bundler',
    }
  },
  plugins: [
    new webpack.DefinePlugin({
      __VUE_OPTIONS_API__: true,
      __VUE_PROD_DEVTOOLS__: false
    })
  ]
}

environment.config.merge(customWebpackConfig)

module.exports = environment
```

(don't forget to restart webpacker when changing this file!)

and then finally compile the JavaScript code with webpack:

```
$ bin/webpack --watch
```

{% hint style="warning" %}
When you update the `matestack-ui-bootstrap` Ruby gem, make sure to update the npm package as well!
{% endhint %}

### Stylesheet/Icon setup

Tell Webpack to import Bootstraps CSS:

`app/javascript/packs/stylesheets/application.scss`

```css
@import "~bootstrap/scss/bootstrap.scss";
```

Import the required JS libraries and mount MatestackUiCore and MatestackUiBootstrap properly. We recommend to remove Turbolinks, as it might interfere with some of the reactivity feature of Matestack:

`app/javascript/packs/application.js`

```javascript
import "./stylesheets/application.scss"; // add this

import { createApp } from 'vue'
import MatestackUiVueJs from 'matestack-ui-vuejs'

import MatestackUiBootstrap from 'matestack-ui-bootstrap'

const appInstance = createApp({})

MatestackUiBootstrap.registerComponents(appInstance)

document.addEventListener('DOMContentLoaded', () => {
  MatestackUiVueJs.mount(appInstance)
})
```

Download and import Bootstraps icons:

`app/assets/images/icons`

* download latest compatible icons: [https://github.com/twbs/icons/releases/tag/v1.8.1](https://github.com/twbs/icons/releases/tag/v1.8.1)
* extract the bootstrap-icons.svg to this path: app/assets/images/icons \(currently served via assets pipeline, we had issues serving the icons via Webpack\)

and finally compile the code with webpack:

```text
$ bin/webpack --watch
```

## Update

{% hint style="warning" %}
When you update the `matestack-ui-bootstrap` Ruby gem, make sure to update the npm package as well!
{% endhint %}

### Ruby Gem

Depending on the entry in your Gemfile, you might need to adjust the allowed version ranges in order to update the Gem. After checked and adjusted the version ranges, run:

```bash
bundle update matestack-ui-bootstrap
```

and then check the installed version:

```bash
bundle info matestack-ui-bootstrap
```

### JavaScript Package via Yarn

If you've installed the JavaScript dependecies via Yarn/Webpacker you need to update the JavaScript assets via yarn:

```bash
yarn update matestack-ui-bootstrap
```

and finally check if the correct version is installed:

```bash
yarn list --pattern "matestack-ui-bootstrap"
```

{% hint style="warning" %}
The Ruby gem version and the NPM package version should match!
{% endhint %}
