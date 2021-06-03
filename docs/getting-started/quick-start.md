# Quick Start \[WIP\]

{% hint style="info" %}
We're about to add much more content to this guide. Stay tuned!

Until we have more content in place here, it might be a good idea to review the source code of the [dummy app](https://dummy.matestack.io), which can be found here: [https://github.com/matestack/matestack-ui-bootstrap/tree/main/spec/dummy](https://github.com/matestack/matestack-ui-bootstrap/tree/main/spec/dummy)

That should already give you a good idea how to use `matestack-ui-bootstrap`
{% endhint %}

## Usage

Create Matestack apps, pages and components as described in the docs of `matestack-ui-core` and utilize the components described in the API section in order to create your UI. Just make sure to include the additional Registry in your desired controllers

`app/controllers/application_controller.rb`

```ruby
class ApplicationController < ActionController::Base

  include Matestack::Ui::Core::Helper # described in Core docs

end
```

and include the registry wherever you want to use the components via methods like "bs\_btn" instead of calling the namespaced classes

`app/matestack/application_component.rb`

```ruby
class ApplicationComponent < Matestack::Ui::Component

  include Matestack::Ui::Bootstrap::Registry # use methods like "bs_btn" instead of calling the namespaced classes

end
```

