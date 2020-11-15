# Matestack Bootstrap Form: Radio

The Bootstrap `radio` form component, implemented in Ruby. Use it like any of the other matestack form components in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the configuration options.

## `bootstrap_radio(*args, &block)`
----

Renders one or more bootstrap radio input fields.

**Optional options**

* `label` - Expects a string, gets displayed before the first input field

* `form_text` - Expects a string, gets displayed after the last input field

* `disabled` - If set to `:true`, the radio input fields are set to disabled and clicking them doesn't yield any effect

* `variant` - If set to `:inline`, the wrapping `div` is displayed as `inline-block` instead of the default `block`

## Examples

### Example 1: Basic usage with single checkbox field

Broken right now.

### Example 2: Basic usage with an Array

```ruby
bootstrap_radio key: :foo, options: [1, 2]
```

returns

```html
<div class="form-check ">
  <input id="foo_1" name="foo_1" type="radio" value-type="Integer" value="1" class=" form-check-input">
  <label for="foo_1" class="form-check-label">1</label>
</div>
<div class="form-check ">
  <input id="foo_2" name="foo_2" type="radio" value-type="Integer" value="2" class=" form-check-input">
  <label for="foo_2" class="form-check-label">2</label>
</div>
```

### Example 3: Basic usage with a Hash

```ruby
bootstrap_radio key: :foo, options: { "Option 1": 1, "Option 2": 2 }
```

returns

```html
<div class="form-check ">
  <input id="foo_1" name="foo_Option 1" type="radio" value-type="Integer" value="1" class=" form-check-input">
  <label for="foo_1" class="form-check-label">Option 1</label>
</div>
<div class="form-check ">
  <input id="foo_2" name="foo_Option 2" type="radio" value-type="Integer" value="2" class=" form-check-input">
  <label for="foo_2" class="form-check-label">Option 2</label>
</div>
```

### Example 4: Using a label

```ruby
bootstrap_radio key: :foo, options: [1, 2], label: "Some label"
```

returns

```html
<label class="form-label">Some label</label>
<div class="form-check ">
  <input id="foo_1" name="foo_1" type="radio" value-type="Integer" value="1" class=" form-check-input">
  <label for="foo_1" class="form-check-label">1</label>
</div>
<div class="form-check ">
  <input id="foo_2" name="foo_2" type="radio" value-type="Integer" value="2" class=" form-check-input">
  <label for="foo_2" class="form-check-label">2</label>
</div>
```

### Example 5: Using a form_text

```ruby
bootstrap_radio key: :foo, options: [1, 2], form_text: "some notes"
```

returns

```html
<div class="form-check ">
  <input id="foo_1" name="foo_1" type="radio" value-type="Integer" value="1" class=" form-check-input">
  <label for="foo_1" class="form-check-label">1</label>
</div>
<div class="form-check ">
  <input id="foo_2" name="foo_2" type="radio" value-type="Integer" value="2" class=" form-check-input">
  <label for="foo_2" class="form-check-label">2</label>
</div>
<div id="form_text_for_foo" class="form-text">some notes</div>
```

### Example 6: Using the `disabled` option

```ruby
bootstrap_radio key: :foo, options: [1, 2], disabled: true
```

returns

```html
<div class="form-check ">
  <input disabled="disabled" id="foo_1" name="foo_1" type="radio" value-type="Integer" value="1" class=" form-check-input">
  <label for="foo_1" class="form-check-label">1</label>
</div>
<div class="form-check ">
  <input disabled="disabled" id="foo_2" name="foo_2" type="radio" value-type="Integer" value="2" class=" form-check-input">
  <label for="foo_2" class="form-check-label">2</label>
</div>
```

### Example 7: Using the `:inline` variant

```ruby
bootstrap_radio key: :foo, options: [1, 2], variant: :inline
```

returns

```html
<div class="form-check form-check-inline">
  <input id="foo_1" name="foo_1" type="radio" value-type="Integer" value="1" class=" form-check-input">
  <label for="foo_1" class="form-check-label">1</label>
</div>
<div class="form-check form-check-inline">
  <input id="foo_2" name="foo_2" type="radio" value-type="Integer" value="2" class=" form-check-input">
  <label for="foo_2" class="form-check-label">2</label>
</div>
```
