# Textarea

The Bootstrap `textarea` form component, implemented in Ruby. Use it like any of the other matestack form components in your apps, pages and components. It offers customizable options to simply achieve what is possible in Bootstrap with this component. See below for more information about the configuration options.

## `bs_form_textarea(*args, &block)`

Renders a Bootstrap textarea field.

**Optional options**

* `label` - Expects a string, gets displayed before the select menu
* `form_text` - Expects a string, gets displayed after the select menu
* `disabled` - If set to `:true`, the input field is set to disabled and clicking them doesn't yield any effec
* `placeholder` - Expects a string to be displayed as a placeholder for whatever the user decides to choose for the `:file` input. Defaults to "Choose file"
* `variant` - Expects a symbol to change the size of the select menu, you can use either `:sm` or `:lg`
* `rows` - Specifies the visible number of lines in a text area.
* `cols` - Specifies the visible width of a textarea.

## Examples

### Example 1: Basic usage

```ruby
bs_form_textarea key: :foo, type: :text
```

### Example 2: Basic usage with label and form text

```ruby
bs_form_textarea key: :foo, type: :text, label: "Input field", form_text: "some notes"
```

### Example 3: Basic usage as disabled input

```ruby
bs_form_textarea key: :foo, type: :text, disabled: true
```

returns

### Example 4: Basic usage with custom class

```ruby
bs_form_textarea key: :foo, type: :text, class: "some-class"
```

### Example 5: Basic usage with placeholder

```ruby
bs_form_textarea key: :foo, type: :text, placeholder: "fill!"
```

### Example 6: Basic usage with rows and cols set

```ruby
bs_form_textarea key: :foo, type: :text, rows: 5, cols: 30
```


