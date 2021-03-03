# Matestack Bootstrap Form: Checkbox

The Bootstrap `checkbox` form component, implemented in Ruby. Use it like any of the other matestack form components in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the configuration options.

## `bs_form_checkbox(*args, &block)`
----

Renders one (nil/true/false) or multiple (array of selected values) bootstrap checkbox input fields.

**Optional options**

* `options` - Expects an Array or Hash of selectable options

* `label` - Expects a string, gets displayed before the first input field

* `form_text` - Expects a string, gets displayed after the last input field

* `disabled` - If set to `:true`, the checkbox input fields are set to disabled and clicking them doesn't yield any effect

* `variant` - If set to `:inline`, the wrapping `div` is displayed as `inline-block` instead of the default `block`

## Examples

### Example 1: Basic usage with single checkbox field

```ruby
bs_form_checkbox label: "Single checkbox", key: :some_checkbox_input
```

and sends

```ruby
"some_checkbox_input"=>nil # or true, if the input has been clicked or false if the input was clicked again
```

to the corresponding Controller.

### Example 2: Basic usage with an Array

```ruby
bs_form_checkbox key: :foo, options: [1, 2]
```

### Example 3: Basic usage with a Hash

```ruby
bs_form_checkbox key: :foo, options: { "Option 1": 1, "Option 2": 2 }
```

### Example 4: Using a label

```ruby
bs_form_checkbox key: :foo, options: [1, 2], label: "Some label"
```

### Example 5: Using a form_text

```ruby
bs_form_checkbox key: :foo, options: [1, 2], form_text: "some notes"
```

### Example 6: Using the `disabled` option

```ruby
bs_form_checkbox key: :foo, options: [1, 2], disabled: true
```

### Example 7: Using the `:inline` variant

```ruby
bs_form_checkbox key: :foo, options: [1, 2], variant: :inline
```
