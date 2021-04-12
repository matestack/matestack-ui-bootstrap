# Welcome

As an extension for `matestack-ui-core`, `matestack-ui-bootstrap`ships all you need to build beautiful, reactive UIs in pure Ruby and smart CRUD components based on Bootstrap v5. Don't think about styling anymore and just create admin or application UIs faster than ever before!

### Live Demo <a id="live-demo"></a>

Based on `matestack-ui-core` and `matestack-ui-bootstrap` this reactive dummy app was created in pure Ruby without writing any JavaScript, ERB/HAML/SLIM and CSS: \([check it out](https://dummy.matestack.io/) \| [source code](https://github.com/matestack/matestack-ui-bootstrap/tree/main/spec/dummy)\)

![https://dummy.matestack.io](https://gblobscdn.gitbook.com/assets%2F-MSlZxQYRyTJNqEznL8o%2F-MTevzmZSIIaZYSkG4fv%2F-MTfYhwWbFzn_uGOlml9%2Fimage.png?alt=media&token=cbf6d7df-7d94-450e-9925-b42eb2cb0a3f)

{% hint style="info" %}
We do not offer Sprocktes Support in order to include the JavaScript part of `matestack-ui-bootstrap`. Please use something like Webpacker instead! Sprockets support will be dropped soon for `matestack-ui-core` as well!
{% endhint %}

### Webpacker Installation

```text
bundle add 'matestack-ui-bootstrap'
yarn add 'matestack-ui-bootstrap'
```

`app/views/layouts/application.html.erb`

```text
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

```css
@import "~bootstrap/scss/bootstrap.scss";
```

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

`app/assets/images/icons`

* download latest compatible icons: [https://github.com/twbs/icons/releases/tag/v1.3.0](https://github.com/twbs/icons/releases/tag/v1.3.0)
* extract the bootstrap-icons.svg to this path: app/assets/images/icons \(served via assets pipeline\)

### Usage 

Create Matestack apps, pages and components as described in the docs of `matestack-ui-core` and utilize the components described in the API section in order to create your UI. Just make sure to include the additional Registry in your desired controllers

`app/controllers/application_controller.rb`

```ruby
class ApplicationController < ActionController::Base

  include Matestack::Ui::Core::Helper # described in Core docs

end

```

and include the registry wherever you want to use the components via methods like "bs_btn" instead of calling the namespaced classes

`app/matestack/application_component.rb`

```ruby
class ApplicationComponent < Matestack::Ui::Bootstrap

  include Matestack::Ui::Bootstrap::Registry # use methods like "bs_btn" instead of calling the namespaced classes

end

```
