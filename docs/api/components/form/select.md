# Matestack Bootstrap Form: Select

The Bootstrap `select menu` form component, implemented in Ruby. Use it like any of the other matestack form components in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the configuration options.

## `bs_form_select(*args, &block)`
----

Renders a Bootstrap form dropdown select menu.

**Required options**

* `options` - Expects an Array or Hash of selectable options

**Optional options**

* `label` - Expects a string, gets displayed before the select menu

* `form_text` - Expects a string, gets displayed after the select menu

* `variant` - Expects a symbol to change the size of the select menu, you can use either `:sm` or `:lg`

## Examples

### Example 1: Basic usage with array

```ruby
bs_form_select key: :foo, options: [1, 2, 3]
```

### Example 2: Basic usage with hash

```ruby
bs_form_select key: :foo, options: { "Option 1": 1, "Option 2": 2, "Option 3": 3 }
```

### Example 3: Basic usage with custom class

```ruby
bs_form_select key: :foo, options: [1, 2, 3], class: "some-class"
```

### Example 4: Basic usage with label

```ruby
bs_form_select key: :foo, options: [1, 2, 3], label: "Some label"
```

### Example 5: Basic usage with placeholder

```ruby
bs_form_select key: :foo, options: [1, 2, 3], placeholder: "select!"
```

### Example 5: Basic usage with form_text

```ruby
bs_form_select key: :foo, options: [1, 2, 3], form_text: "some notes"
```

### Example 6: Basic usage with variant

```ruby
bs_form_select key: :foo, options: [1, 2, 3], variant: :lg
```
