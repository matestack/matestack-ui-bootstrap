# Radio

The Bootstrap `radio` form component, implemented in Ruby. Use it like any of the other matestack form components in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the configuration options.

## `bs_form_radio(*args, &block)`

Renders bootstrap radio input fields.

**Required options**

* `options` - Expects an Array or Hash of selectable options

**Optional options**

* `label` - Expects a string, gets displayed before the first input field
* `form_text` - Expects a string, gets displayed after the last input field
* `disabled` - If set to `:true`, the radio input fields are set to disabled and clicking them doesn't yield any effect
* `variant` - If set to `:inline`, the wrapping `div` is displayed as `inline-block` instead of the default `block`

## Examples

### Example 1: Basic usage with an Array

```ruby
bs_form_radio key: :foo, options: [1, 2]
```

### Example 2: Basic usage with a Hash

```ruby
bs_form_radio key: :foo, options: { "Option 1": 1, "Option 2": 2 }
```

### Example 3: Using a label

```ruby
bs_form_radio key: :foo, options: [1, 2], label: "Some label"
```

### Example 4: Using a form\_text

```ruby
bs_form_radio key: :foo, options: [1, 2], form_text: "some notes"
```

### Example 5: Using the `disabled` option

```ruby
bs_form_radio key: :foo, options: [1, 2], disabled: true
```

### Example 6: Using the `:inline` variant

```ruby
bs_form_radio key: :foo, options: [1, 2], variant: :inline
```

