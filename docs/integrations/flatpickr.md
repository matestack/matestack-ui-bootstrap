# Flatpickr

[Flatpickr](https://flatpickr.js.org) Datepicker integration, compatible with Bootstrap's design schema. In order to limit the scope of the `matestack-ui-bootstrap` gem, Flatpickr is not part of this gem.

The below shown example should enable you to easily integrate Flatpickr \(or any other Datepicker library\) according to your needs!

## Ruby component

`app/matestack/components/form/flatpickr.rb`

```ruby
class Components::Form::Flatpickr < Matestack::Ui::Bootstrap::Form::Input

  optional :enable_time

  vue_name "form-flatpickr-component"

  def vue_props
    {
      init_value: init_value,
      enable_time: enable_time
    }
  end

  def response
    # exactly one root element is required since this is a Vue.js component template
    div class: "form-flatpickr-component" do
      label input_label, for: attr_key,  class: "form-label" if input_label
      input input_attributes.merge(bootstrap_flatpickr_input_attributes)
      render_errors
      render_form_text
    end
  end

  def bootstrap_flatpickr_input_attributes
    bootstrap_input_attributes.merge({
      type: :text,
      class: (options[:class] || "") << (" form-control flatpickr"),
      disabled: disabled
    })
  end

end
```


## Vue.js component

**Do not forget to require flatpickr in your package.json** **Do not forget to import the following file into you application pack**

`app/matestack/components/form/flatpickr.js`

```javascript
import flatpickr from "flatpickr";
import MatestackUiVueJs from 'matestack-ui-vuejs'

const flatpickrComponent = {
  mixins: [MatestackUiVueJs.componentMixin, MatestackUiVueJs.formInputMixin],
  template: MatestackUiVueJs.componentHelpers.inlineTemplate,

  data() {
    return {};
  },
  mounted: function(){
    flatpickr(this.getElement().querySelector('.flatpickr'), {
      defaultDate: this.props["init_value"],
      enableTime: (this.props["enable_time"] == true)
    });
    //all kind of configuration possible for flatpickr may be implemented here according to your needs
  }
}

export default flatpickrComponent
```

and then in your application.js file:

```javascript
import flatpickrComponent from '../../matestack/components/form/flatpickr.js'// import component definition from source

const appInstance = createApp({})

appInstance.component('form-flatpickr-component', flatpickrComponent) // register at appInstance

MatestackUiBootstrap.registerComponents(appInstance)

document.addEventListener('DOMContentLoaded', () => {
  MatestackUiVueJs.mount(appInstance)
})
```

## Usage

### Example 1: Usage in form \(e.g. mapped to an Active Record model\) with enabled time picker

```ruby
matestack_form some_form_config do

  div class: "mb-3" do
    Components::Form::Flatpickr.call(key: :shipped_at, label: "Shipped at", enable_time: true, type: :text)
  end

  div class: "mb-3" do
    bs_form_submit button_variant: :primary, spinner_variant: :light, text: "Submit"
  end

end
```
