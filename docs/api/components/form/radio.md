    radio_options.to_a.each_with_index do |item, index|
      div class: "form-check #{'form-check-inline' if variant == :inline}" do
        input html_attributes.merge(
          attributes: vue_attributes,
          type: :radio,
          id: "#{id_for_item(item_value(item))}",
          name: item_name(item),
          value: item_value(item),
          class: radio_class,
          disabled: disabled
        )
        label class: "form-check-label", text: item_label(item), for: id_for_item(item_value(item))
        if index == radio_options.to_a.size - 1
          render_errors
        end
      end
    end

  def vue_attributes
    (options[:attributes] || {}).merge({
      "@change": change_event,
      ref: "select.#{attr_key}",
      'init-value': init_value,
      'v-bind:class': "{ '#{input_error_class}': #{error_key} }",
      'value-type': value_type,
      "#{v_model_type}": input_key,
    })
  end

# Matestack Bootstrap Form: Radio

The Bootstrap `radio` form component, implemented in Ruby. Use it like any of the other matestack form components in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the configuration options.

## `bootstrap_radio(*args, &block)`
----

Renders a bootstrap radio input field.

**Optional options**

* `label` - Expects a string, gets displayed before the first input field

* `form_text` - Expects a string, gets displayed after the last input field

* `disabled` - If set to `:true`, the switch input fields are set to disabled and clicking them doesn't yield any effect

* `variant` - If set to `:inline`, the wrapping `div` is displayed as `inline-block` instead of the default `block`

## Examples

### Example 1: Basic usage with single true/false radio button

```ruby
  bootstrap_switch key: :some_radio_input, label: 'Some input'
```

returns

```html
<div class="form-check form-switch ">
<input type="hidden" value="" class="">
<input id="_" name="some_radio_input" type="checkbox" value="1" class="form-check-input">
<label for="_" class="form-check-label">Some input</label>
</div>
```

and sends

```ruby
"some_radio_input"=>false # or true, if the input has been clicked
```

to the corresponding Controller.

### Example 2: Basic usage with an Array

```ruby
bootstrap_switch key: :foo, options: [1, 2]
```

returns

```html
<div class="form-check form-switch ">
  <input id="_1" name="1" type="checkbox" value-type="Integer" value="1" class="form-check-input">
  <label for="_1" class="form-check-label">1</label>
</div>
<div class="form-check form-switch ">
  <input id="_2" name="2" type="checkbox" value-type="Integer" value="2" class="form-check-input">
  <label for="_2" class="form-check-label">2</label>
</div>
```

### Example 3: Basic usage with a Hash

```ruby
bootstrap_switch key: :foo, options: { "Option 1": 1, "Option 2": 2 }
```

returns

```html
<div class="form-check form-switch ">
  <input id="_1" name="1" type="checkbox" value-type="Integer" value="1" class="form-check-input">
  <label for="_1" class="form-check-label">Option 1</label>
</div>
<div class="form-check form-switch ">
  <input id="_2" name="2" type="checkbox" value-type="Integer" value="2" class="form-check-input">
  <label for="_2" class="form-check-label">Option 2</label>
</div>
```

### Example 4: Using a label

```ruby
  bootstrap_switch key: :foo, options: [1, 2], label: "Some label"
```

returns

```html
<label for="foo" class="form-label">Some label</label>
<div class="form-check form-switch ">
  <input id="_1" name="1" type="checkbox" value-type="Integer" value="1" class="form-check-input"> <label for="_1" class="form-check-label">1</label>
</div>
<div class="form-check form-switch ">
  <input id="_2" name="2" type="checkbox" value-type="Integer" value="2" class="form-check-input"><label for="_2" class="form-check-label">2</label>
</div>
```

### Example 5: Using a form_text

```ruby
bootstrap_switch key: :foo, options: { "Option 1": 1, "Option 2": 2 }
```

returns

```html
<div class="form-check form-switch ">
  <input id="_1" name="1" type="checkbox" value-type="Integer" value="1" class="form-check-input"><label for="_1" class="form-check-label">1</label>
</div>
<div class="form-check form-switch ">
  <input id="_2" name="2" type="checkbox" value-type="Integer" value="2" class="form-check-input"><label for="_2" class="form-check-label">2</label>
</div>
<div id="form_text_for_foo" class="form-text">some notes</div>
```

### Example 6: Using the `disabled` option

```ruby
  bootstrap_switch key: :foo, options: [1, 2], disabled: true
```

returns

```html
<div class="form-check form-switch ">
  <input disabled="disabled" id="_1" name="1" type="checkbox" value-type="Integer" value="1" class="form-check-input">
  <label for="_1" class="form-check-label">1</label>
</div>
<div class="form-check form-switch ">
  <input disabled="disabled" id="_2" name="2" type="checkbox" value-type="Integer" value="2" class="form-check-input"><label for="_2" class="form-check-label">2</label>
</div>
```

### Example 7: Using the `:inline` variant

```ruby
bootstrap_switch key: :foo, options: { "Option 1": 1, "Option 2": 2 }
```

returns

```html
<div class="form-check form-switch form-check-inline">
  <input id="_1" name="1" type="checkbox" value-type="Integer" value="1" class="form-check-input"><label for="_1" class="form-check-label">1</label>
</div>
<div class="form-check form-switch form-check-inline">
  <input id="_2" name="2" type="checkbox" value-type="Integer" value="2" class="form-check-input"><label for="_2" class="form-check-label">2</label>
</div>
```
