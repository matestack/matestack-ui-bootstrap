# JS via Webpacker

Add 'matestack-ui-vuejs' to your `package.json` by adding:

```
{
  "name": "my-app",
  "dependencies": {
    "matestack-ui-bootstrap": "^3.1.0",
    "..."
  }
}
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
      'matestack-ui-vuejs': 'matestack-ui-vuejs/lib/matestack/ui/vue_js/index.js', // in order not to use the esm package
      'matestack-ui-bootstrap': 'matestack-ui-bootstrap/lib/matestack/ui/bootstrap/index.js' // in order not to use the esm package
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

###
