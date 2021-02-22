# Matestack Bootstrap Form: Input

The Bootstrap `input` form component, implemented in Ruby. Use it like any of the other matestack form components in your apps, pages and components. It offers customizable options to simply achieve what is possible in Bootstrap with this component. See below for more information about the configuration options.

## `bootstrap_input(*args, &block)`
----

Renders a Bootstrap input field.

**Optional options**

* `type` - Defaults to `:text`, can be set to `:range` or `:file`

* `label` - Expects a string, gets displayed before the select menu

* `form_text` - Expects a string, gets displayed after the select menu

* `disabled` - If set to `:true`, the input field is set to disabled and clicking them doesn't yield any effect

* `browse_button_text` - Expects a string and sets the text to be displayed in the "browse" button for the `:file` input

* `placeholder` - Expects a string to be displayed as a placeholder for whatever the user decides to choose for the `:file` input. Defaults to "Choose file"

* `variant` - Expects a symbol to change the size of the select menu, you can use either `:sm` or `:lg` 

* `min` - Sets the corresponding HTML attribute for the `:range` input type

* `max` - Sets the corresponding HTML attribute for the `:range` input type

* `step` - Sets the corresponding HTML attribute for the `:range` input type

* `show_value` - Expects a boolean. Defaults to `false`, if set to `true` it displays the current value for the corresponding `:range` input type field

## Examples

### Example 1: Basic usage

```ruby
bootstrap_input key: :foo, type: :text
```

returns

```html
<input aria-describedby="foo" id="foo" type="text" class=" form-control">
```

### Example 2: Basic usage with label and form text

```ruby
bootstrap_input key: :foo, type: :text, label: "Input field", form_text: "some notes"
```

returns

```html
<label for="foo" class="form-label">Input field</label>
<input aria-describedby="foo" id="foo" type="text" class=" form-control">
<div id="form_text_for_foo" class="form-text">some notes</div>
```

### Example 3: Basic usage as disabled input

```ruby
bootstrap_input key: :foo, type: :text, disabled: true
```

returns

```html
<input aria-describedby="foo" disabled="disabled" id="foo" type="text" class=" form-control">
```

### Example 4: Basic usage with custom class

```ruby
bootstrap_input key: :foo, type: :text, class: "some-class"
```

returns

```html
<input aria-describedby="foo" id="foo" type="text" class="some-class form-control" >
```

### Example 5: Basic usage with placeholder

```ruby
bootstrap_input key: :foo, type: :text, placeholder: "fill!"
```

returns

```html
<input aria-describedby="foo" id="foo" placeholder="fill!" type="text" class=" form-control" >
```

### Example 6: Basic usage as range input

```ruby
bootstrap_input key: :some_range_input, type: :range, max: 10
```

returns

```html
<input aria-describedby="some_range_input" id="some_range_input" max="10" type="range" class=" form-range">
```

### Example 7: Using range input with show_value and non-default steps

```ruby
bootstrap_input key: :some_range_input, type: :range, step: 2, max: 10, show_value: true
```

returns

```html
<input aria-describedby="some_range_input" id="some_range_input" max="10" step="2" type="range" class=" form-range">
<div id="some_range_input" class="form-text">4</div>
```

### Example 8: Basic usage as file input

```ruby
bootstrap_input key: :some_single_file_input, type: :file
```

returns

```html
<div class=" form-file">
  <input aria-describedby="some_single_file_input" id="some_single_file_input" type="file" class=" form-file-input">
  <label for="some_single_file_input" class="form-file-label">
    <span class="form-file-text">Choose file</span> 
    <span class="form-file-button">Browse</span>
  </label>
</div>
```

### Example 9: File input with non-default size and optional form_text

```ruby
bootstrap_input variant: :lg, form_text: "just some notes", key: :some_single_file_input, type: :file
```

returns

```html
<div class=" form-file form-file-lg">
  <input aria-describedby="some_single_file_input" id="some_single_file_input" type="file" class=" form-file-input">
  <label for="some_single_file_input" class="form-file-label">
    <span class="form-file-text">Choose file</span>
    <span class="form-file-button">Browse</span>
  </label>
</div>
```

### Example 10: Multi-file input with placeholder and browse_button_text

```ruby
bootstrap_input placeholder: "Select a file", browse_button_text: "Click", key: :some_multi_file_input, type: :file, multiple: true
```

returns

```html
<div class=" form-file">
  <input aria-describedby="some_multi_file_input[]" id="some_multi_file_input[]" multiple="multiple" placeholder="Select a file" type="file" class=" form-file-input">
  <label for="some_multi_file_input[]" class="form-file-label">
    <span class="form-file-text">Select a file</span>
    <span class="form-file-button">Click</span>
  </label>
</div>
```

