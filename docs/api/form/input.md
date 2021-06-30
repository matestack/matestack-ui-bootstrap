# Input

The Bootstrap `input` form component, implemented in Ruby. Use it like any of the other matestack form components in your apps, pages and components. It offers customizable options to simply achieve what is possible in Bootstrap with this component. See below for more information about the configuration options.

## `bs_form_input(*args, &block)`

Renders a Bootstrap input field.

**Optional options**

* `type` - Defaults to `:text`, can be set to `:range` or `:file`
* `label` - Expects a string, gets displayed before the select menu
* `form_text` - Expects a string, gets displayed after the select menu
* `disabled` - If set to `:true`, the input field is set to disabled and clicking them doesn't yield any effect
* `browse_button_text` - Expects a string and sets the text to be displayed in the "browse" button for the `:file` input
* `placeholder` - Expects a string to be displayed as a placeholder for whatever the user decides to choose for the `:file` input. Defaults to "Choose file"
* `variant` - Expects a symbol to change the size of the select menu, you can use either `:sm` or `:lg`
* `min` - Sets the corresponding HTML attribute
* `max` - Sets the corresponding HTML attribute
* `step` - Sets the corresponding HTML attribute
* `show_value` - Expects a boolean. Defaults to `false`, if set to `true` it displays the current value for the corresponding `:range` input type field

## Examples

### Basic usage for text input

```ruby
bs_form_input key: :foo, type: :text
```

### Basic usage for float number input

```ruby
bs_form_input key: :foo, type: :number, step: 0.01
```

### Basic usage with label and form text

```ruby
bs_form_input key: :foo, type: :text, label: "Input field", form_text: "some notes"
```

### Basic usage as disabled input

```ruby
bs_form_input key: :foo, type: :text, disabled: true
```

returns

### Basic usage with custom class

```ruby
bs_form_input key: :foo, type: :text, class: "some-class"
```

### Basic usage with placeholder

```ruby
bs_form_input key: :foo, type: :text, placeholder: "fill!"
```

### Basic usage as range input

```ruby
bs_form_input key: :some_range_input, type: :range, max: 10
```

### Using range input with show\_value and non-default steps

```ruby
bs_form_input key: :some_range_input, type: :range, step: 2, max: 10, show_value: true
```

### Basic usage as file input

```ruby
bs_form_input key: :some_single_file_input, type: :file
```

### File input with non-default size and optional form\_text

```ruby
bs_form_input variant: :lg, form_text: "just some notes", key: :some_single_file_input, type: :file
```

### Multi-file input with placeholder and browse\_button\_text

```ruby
bs_form_input placeholder: "Select a file", browse_button_text: "Click", key: :some_multi_file_input, type: :file, multiple: true
```

