---
description: shipped in matestack-ui-bootstrap 3.1
---

# JS via Importmap

Please follow the importmap install guide for `matestack-ui-vuejs` first: [https://docs.matestack.io/matestack-ui-vuejs/getting-started/installation-update/importmap-install-steps](https://docs.matestack.io/matestack-ui-vuejs/getting-started/installation-update/importmap-install-steps)

### Pins

Please add the pins manually:

`config/importmap.rb`

```ruby
# pins for matestack-ui-vuejs
pin "vue", to: "https://ga.jspm.io/npm:vue@3.2.31/dist/vue.esm-browser.js" if Rails.env.development?
pin "vue", to: "https://ga.jspm.io/npm:vue@3.2.31/dist/vue.esm-browser.prod.js" if Rails.env.production?
pin "matestack-ui-vuejs", to: "https://cdn.jsdelivr.net/npm/matestack-ui-vuejs@3.1.0/dist/matestack-ui-vuejs.esm.js"
# below pins for matestack-ui-boostrap
pin "@popperjs/core", to: "https://unpkg.com/@popperjs/core@2/dist/esm/popper.js"
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.esm.min.js"
pin "matestack-ui-bootstrap", to: "https://cdn.jsdelivr.net/npm/matestack-ui-bootstrap@3.1.0/dist/matestack-ui-bootstrap.esm.js"
```

### Usage

`app/javascript/packs/application.js`

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

### (S)CSS setup

#### Without cssbundling-rails

`app/views/layout.html.erb`

```markup
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/matestack-ui-bootstrap@3.1.0/dist/matestack-ui-bootstrap.css" rel="stylesheet" >

<%= javascript_importmap_tags %>
```

Please adjust the version numbers to your needs. They should match the JavaScript package versions used in the importmap config.

#### With cssbundling-rails

\--> In order to use SCSS features e.g. for Bootstrap theming&#x20;

(without jsbundling-rails, using importmap approach for JavaScript assets instead in this guide)

**Install cssbundling-rails**

Like documented here: [https://github.com/rails/cssbundling-rails](https://github.com/rails/cssbundling-rails)

```bash
./bin/bundle add cssbundling-rails
```

```bash
./bin/rails css:install:bootstrap
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
    "sass": "^1.52.2"
  },
  "scripts": {
    "build:css": "sass ./app/assets/stylesheets/application.bootstrap.scss ./app/assets/builds/application.css --no-source-map --load-path=node_modules"
  }
}

```

This package.json will install all the JavaScript packages pinned via importmap config into the node\_modules folder. We just use the scss parts of it. Alternativel to the `importmap` approach, you could use `jsbundling-rails`
