# Matestack Bootstrap Form: Select

The Bootstrap `select menu` form component, implemented in Ruby. Use it like any of the other matestack form components in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the configuration options.

## `bootstrap_select(*args, &block)`
----

Renders a Bootstrap dropdown select menu.

**Optional options**

* `label` - Expects a string, gets displayed before the select menu

* `form_text` - Expects a string, gets displayed after the select menu

* `variant` - Expects a symbol to change the size of the select menu, you can use either `:sm` or `:lg` 

## Examples

### Example 1: Basic usage with array

```ruby
bootstrap_select key: :foo, options: [1, 2, 3]
```

gets turned into 

```html
<select id="foo" value-type="Integer" class=" form-select">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option
></select>
```

### Example 2: Basic usage with hash

```ruby
bootstrap_select key: :foo, options: { "Option 1": 1, "Option 2": 2, "Option 3": 3 }
```

gets turned into 

```html
<select id="foo" value-type="Integer" class=" form-select">
  <option value="1">Option 1</option>
  <option value="2">Option 2</option>
  <option value="3">Option 3</option>
</select>
```

### Example 3: Basic usage with custom class

```ruby
bootstrap_select key: :foo, options: [1, 2, 3], class: "some-class"
```

gets turned into 

```html
<select id="foo" value-type="Integer" class="some-class form-select">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
</select>
```

### Example 4: Basic usage with label

```ruby
bootstrap_select key: :foo, options: [1, 2, 3], label: "Some label"
```

gets turned into 

```html
<label for="foo" class="form-label">Some label</label>
<select id="foo" value-type="Integer" class=" form-select">
  <option value="1">1</option> 
  <option value="2">2</option> 
  <option value="3">3</option>
</select>
```

### Example 5: Basic usage with placeholder

```ruby
bootstrap_select key: :foo, options: [1, 2, 3], placeholder: "select!"
```

gets turned into 

```html
<select id="foo" value-type="Integer" class=" form-select">
  <option disabled="disabled" selected="selected" value="null">select!</option> 
  <option value="1">1</option> 
  <option value="2">2</option> 
  <option value="3">3</option>
</select>
```

### Example 5: Basic usage with form_text

```ruby
bootstrap_select key: :foo, options: [1, 2, 3], form_text: "some notes"
```

gets turned into 

```html
<select id="foo" value-type="Integer" class=" form-select">
  <option value="1">1</option> 
  <option value="2">2</option> 
  <option value="3">3</option>
</select>
<div id="form_text_for_foo" class="form-text">some notes</div>
```

### Example 6: Basic usage with variant

```ruby
bootstrap_select key: :foo, options: [1, 2, 3], variant: :lg
```

gets turned into 

```html
<select id="foo" value-type="Integer" class=" form-select form-select-lg">
  <option value="1">1</option> 
  <option value="2">2</option> 
  <option value="3">3</option>
</select>
```
