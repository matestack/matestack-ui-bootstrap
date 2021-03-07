# Flatpickr

[Flatpickr](https://flatpickr.js.org) Datepicker integration, compatible with Bootstrap's design schema. In order to limit the scope of the `matestack-ui-bootstrap` gem, Flatpickr is not part of this gem.

The below shown example should enable you to easily integrate Flatpickr \(or any other Datepicker library\) according to your needs!

## Ruby component

`app/matestack/components/form/flatpickr.rb`

```ruby
class Components::Form::Flatpickr < Matestack::Ui::Bootstrap::Form::Input

  optional :enable_time

  vue_js_component_name "form-flatpickr-component"

  def setup
    @component_config[:init_value] = init_value
    @component_config[:enable_time] = enable_time
  end

  def response
    # exactly one root element is required since this is a Vue.js component template
    div class: "form-flatpickr-component" do
      label for: attr_key,  class: "form-label", text: input_label if input_label
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

`app/matestack/components/registry.rb`

## Registry

```ruby
module Components::Registry

  Matestack::Ui::Core::Component::Registry.register_components(
    #...
    form_flatpickr: Components::Form::Flatpickr
    #...
  )

end
```

`app/matestack/components/chart_js.js`

## Vue.js component

**Do not forget to require flatpickr in your package.json** **Do not forget to import the following file into you application pack**

```javascript
import flatpickr from "flatpickr";

MatestackUiCore.Vue.component('form-flatpickr-component', {
  mixins: [MatestackUiCore.componentMixin, MatestackUiCore.formInputMixin],
  data() {
    return {};
  },
  mounted: function(){
    flatpickr(this.$el.querySelector('.flatpickr'), {
      defaultDate: this.componentConfig["init_value"],
      enableTime: (this.componentConfig["enable_time"] == true)
    });
    //all kind of configuration possible for flatpickr may be implemented here according to your needs
  }
});
```

## Usage

### Example 1: Usage in form \(e.g. mapped to an Active Record model\) with enabled time picker

```ruby
form some_form_config do

  div class: "mb-3" do
    form_flatpickr key: :shipped_at, label: "Shipped at", enable_time: true, type: :text
  end

  div class: "mb-3" do
    bs_form_submit button_variant: :primary, spinner_variant: :light, text: "Submit"
  end

end
```

