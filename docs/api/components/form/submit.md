# Matestack Bootstrap Form: Submit

This form component renders
A form submit button, styled as a Bootstrap `button`, implemented in Ruby. Use it like any of the other matestack form components in your apps, pages and components. It offers customizable options to simply achieve what is possible in Bootstrap with this component. See below for more information about the configuration options.

## `bs_form_submit(*args, &block)`
----

Renders a Bootstrap button that acts as a form submit trigger.

**Optional options**

* `button_variant` - Expects a symbol that defines the Bootstrap style. Defaults to `:primary`

* `spinner_variant` - Expects a symbol that defines the Bootstrap loading spinner style. Defaults to `:light, size: :sm`

* `text` - Expects a string, the content of which get displayed within the button

* `loading_text` - Expects a string, the content of which get displayed while the button is in its "loading"-status

* `size` - Expects a symbol that defines the Bootstrap button size

## Examples

### Example 1: Basic usage without any configuration

```ruby
bs_form_submit
```

### Example 2: Custom text and loading text

```ruby
bs_form_submit text: "Submit!!", loading_text: "Getting submitted"
```

### Example 3: Default texts, custom button and spinner variant

```ruby
bs_form_submit button_variant: :light, spinner_variant: :dark
```
### Example 4: Default texts & variants, different size

```ruby
bs_form_submit size: :lg
```

### Example 5: Non-default text, loading_text, button_variant, spinner_variant, size plus additional, custom class & class_loading

```ruby
bs_form_submit button_variant: :light, spinner_variant: :dark, class: "custom-submit", class_loading: "custom-submit-loading", size: :lg, text: "Submit!!", loading_text: "Getting submitted"
```
