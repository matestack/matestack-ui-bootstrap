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
