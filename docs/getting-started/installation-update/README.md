# Installation & Update

## Installation

Make sure to install and get to know `matestack-ui-core` and `matestack-ui-vuejs` first!

* [https://docs.matestack.io/matestack-ui-core](https://docs.matestack.io/matestack-ui-core)
* [https://docs.matestack.io/matestack-ui-vuejs](https://docs.matestack.io/matestack-ui-vuejs)

Add 'matestack-ui-bootstrap' to your Gemfile

```ruby
gem 'matestack-ui-bootstrap', "~> 3.1.0"
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

#### Webpacker > 5.x based JavaScript installation

{% content-ref url="js-via-webpacker.md" %}
[js-via-webpacker.md](js-via-webpacker.md)
{% endcontent-ref %}

#### Rails 7 importmap based installation

{% content-ref url="js-via-importmap.md" %}
[js-via-importmap.md](js-via-importmap.md)
{% endcontent-ref %}

#### JSBundling-Rails based installation

{% content-ref url="js-via-jsbundling-rails.md" %}
[js-via-jsbundling-rails.md](js-via-jsbundling-rails.md)
{% endcontent-ref %}

### Icons setup

{% hint style="warning" %}
Same approach for all below described Stylesheet setups. Will be optimized in a future release!
{% endhint %}

Download and import Bootstraps icons:

`app/assets/images/icons`

* download latest compatible icons: [https://github.com/twbs/icons/releases/tag/v1.8.1](https://github.com/twbs/icons/releases/tag/v1.8.1)
* extract the bootstrap-icons.svg to this path: app/assets/images/icons (currently served via assets pipeline, we had issues not using the asset pipeline)

### Stylesheet Setup

#### Option 1: Via CDN (CSS only)

{% hint style="info" %}
This option makes sense if you're using the importmap approach for the JS setup and are looking for a minimal setup in order to pull in the required styles. You cannot use SCSS features though.
{% endhint %}

`app/views/layout.html.erb`

```markup
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/matestack-ui-bootstrap@3.1.0/dist/matestack-ui-bootstrap.css" rel="stylesheet" >

<%= javascript_importmap_tags %>
```

Please adjust the version numbers to your needs. They should match the JavaScript package versions used in the importmap config.

#### Option 2a : Importmap + CSSBundling-Rails

{% hint style="info" %}
Use this option if you have installed the JavaScript packages via Importmap and want to use SCSS features like Bootstrap theming
{% endhint %}

**Install cssbundling-rails**

Like documented here: [https://github.com/rails/cssbundling-rails](https://github.com/rails/cssbundling-rails)

```bash
./bin/bundle add cssbundling-rails
```

```bash
./bin/rails css:install:bootstrap
```

And then add `matestack-ui-bootstrap`:

```bash
yarn add matestack-ui-bootstrap
```

Afterwards make sure your package.json looks something like that:

`package.json`

```json
{
  "name": "your-app",
  "private": "true",
  "dependencies": {
    "@popperjs/core": "^2.11.5",
    "bootstrap": "^5.2.0-beta1",
    "bootstrap-icons": "^1.8.3",
    "sass": "^1.52.2",
    "matestack-ui-bootstrap": "^3.1.0"
  },
  "scripts": {
    "build:css": "sass ./app/assets/stylesheets/application.bootstrap.scss ./app/assets/builds/application.css --no-source-map --load-path=node_modules"
  }
}

```

Even if you use the importmap approach, this package.json will install the JavaScript packages into the node\_modules folder. They will not be used when following the importmap approach. Only the (S)CSS files will be used in this case.

And finally adjust the `app/assets/stylesheets/application.bootstrap.scss` to look like:

```scss
@import 'bootstrap/scss/bootstrap';
@import 'matestack-ui-bootstrap/dist/matestack-ui-bootstrap';

```

and run your server and css builder with

```bash
./bin/dev
```

#### Option 2b : JSBundling-Rails + CSSBundling-Rails

{% hint style="info" %}
Use this option if you have installed the JavaScript packages via JSBundling-Rails and want to use SCSS features like Bootstrap theming
{% endhint %}

#### Option 3: Via Webpacker (SCSS)

{% hint style="info" %}
Use this option if you have installed the JavaScript packages via Webpacker as well in order to be able to use SCSS features like Bootstrap theming
{% endhint %}

Tell Webpack to import Bootstraps CSS:

`app/javascript/packs/stylesheets/application.scss`

```css
@import "~bootstrap/scss/bootstrap.scss";
```

`app/javascript/packs/application.js`

```javascript
import "./stylesheets/application.scss"; // add this

import { createApp } from 'vue'
import MatestackUiVueJs from 'matestack-ui-vuejs'
import MatestackUiBootstrap from 'matestack-ui-bootstrap'
// ...
```

and compile with:

```
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
