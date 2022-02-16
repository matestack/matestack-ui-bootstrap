# Migrate from 2.x to 3.0

**Please follow the migration guides from `matestack-ui-core` and `matestack-ui-vuejs` first!**

You can go through the dummy app to review the result of the miration [here](https://github.com/matestack/matestack-ui-bootstrap/tree/main/spec/dummy) The dummy app was updated to Matestack 3 and Rails 7

## JavaScript setup changed

Below you see the new version of mounting the Vue.js v3 driven `matestack-ui-vuejs` package with notes on how to add `matestack-ui-bootstrap` on top:

`app/javascript/packs/application.js`

```javascript
import "./stylesheets/application.scss"; // add this

import { createApp } from 'vue'
import MatestackUiVueJs from 'matestack-ui-vuejs'

import MatestackUiBootstrap from 'matestack-ui-bootstrap' // add this

const appInstance = createApp({})

MatestackUiBootstrap.registerComponents(appInstance) // add this

document.addEventListener('DOMContentLoaded', () => {
  MatestackUiVueJs.mount(appInstance)
})
```

## ChartJs component (and any custom component) $refs definition and usage:

Defining Vue.js refs has changed:

`app/matestack/components/chart_js.rb`

```ruby
class Components::ChartJs < Matestack::Ui::VueJsComponent
  vue_name "chart-js-component"

  # ...

  def response
    div class: "chart-container #{context.bs_class}",  style: "width: 100%; height: 100%;" do
      # documented before:
      # plain "<canvas ref='chart'></canvas>".html_safe
      # instead do:
      plain "<canvas matestack-ui-vuejs-ref=#{matestack_ui_vuejs_ref('chart')}></canvas>".html_safe
    end
  end

end
```

`app/matestack/components/chart_js.js`

```javascript
const chartElement = this.$refs.chart // before
//...
const chartElement = this.getRefs().chart // after (search above and replace)
//...
```

**More migration steps for ChartJs component required, see below!**

## Flatpickr component (and any custom component) $el usage

`app/matestack/components/form/flatpickr.js`
```javascript
//...
// flatpickr(this.$el.querySelector('.flatpickr'), { // old
flatpickr(this.getElement().querySelector('.flatpickr'), {
  defaultDate: this.props["init_value"],
  enableTime: (this.props["enable_time"] == true)
});
//...
```

**More migration steps for Flatpickr component required, see below!**

## Custom component (including ChartJs/Flatpickr) integration

The custom component defintion and integration has changed. Below you see on the example of the ChartJs component, what needs to be changed:

`app/matestack/components/chart_js.js`

```javascript
import Chart from 'chart.js';
import MatestackUiVueJs from 'matestack-ui-vuejs' // new package name!
// no Vue import here anymore

// no more Vue.component(...), define plain object here:
const chartJsComponent = {
  mixins: [MatestackUiVueJs.componentMixin], // new package name!
  template: MatestackUiVueJs.componentHelpers.inlineTemplate, // add this
  // ...
}

export default chartJsComponent // add export
```

and then in your application.js file:

```javascript
import chartJsComponent from '../../matestack/components/chart_js.js'// import component definition from source

const appInstance = createApp({})

appInstance.component('chart-js-component', chartJsComponent) // register at appInstance

MatestackUiBootstrap.registerComponents(appInstance)

document.addEventListener('DOMContentLoaded', () => {
  MatestackUiVueJs.mount(appInstance)
})
```

## Admin template class

- `Matestack::Ui::Bootstrap::Apps::AdminTemplate` is now `Matestack::Ui::Bootstrap::Layouts::AdminTemplate`

--> Search & Replace

## Manually including the registry is not longer required

- `include Matestack::Ui::Bootstrap::Registry` can now be removed as it the component will be automatically available when installing `matestack-ui-bootstrap`
