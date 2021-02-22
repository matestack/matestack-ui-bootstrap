# Matestack Bootstrap Form: Submit

This form component renders
A form submit button, styled as a Bootstrap `button`, implemented in Ruby. Use it like any of the other matestack form components in your apps, pages and components. It offers customizable options to simply achieve what is possible in Bootstrap with this component. See below for more information about the configuration options.

## `bootstrap_submit(*args, &block)`
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
bootstrap_submit
```

returns

```html
<button type="button" class="btn btn-primary">Submit</button>
```

and upon clicking turns into

```html
<button type="button" class="btn btn-primary" disabled="disabled">
    <div role="status" class="spinner-border text-light spinner-border-sm">
        <span class="sr-only">Loading...</span>
    </div>
    Loading...
</button>
```

### Example 2: Custom text and loading text

```ruby
bootstrap_submit text: "Submit!!", loading_text: "Getting submitted"
```

returns

```html
<button type="button" class="btn btn-primary">Submit!!</button>
```

and upon clicking turns into

```html
<button type="button" class="btn btn-primary" disabled="disabled">
    <div role="status" class="spinner-border text-light spinner-border-sm">
        <span class="sr-only">Loading...</span>
    </div>
    Getting submitted
</button>
```

### Example 3: Default texts, custom button and spinner variant 

```ruby
bootstrap_submit button_variant: :light, spinner_variant: :dark
```

returns

```html
<button type="button" class="btn btn-light">Submit</button>
```

and upon clicking turns into

```html
<button type="button" class="btn btn-light" disabled="disabled">
    <div role="status" class="spinner-border text-dark spinner-border-sm">
        <span class="sr-only">Loading...</span>
    </div>
    Getting submitted
</button>
```

### Example 4: Default texts & variants, different size

```ruby
bootstrap_submit size: :lg
```

returns

```html
<button type="button" class="btn btn-primary btn-lg">Submit</button>
```

and upon clicking turns into

```html
<button type="button" class="btn btn-primary" disabled="disabled">
    <div role="status" class="spinner-border text-light spinner-border-sm">
        <span class="sr-only">Loading...</span>
    </div>
    Loading...
</button>
```

### Example 5: Non-default text, loading_text, button_variant, spinner_variant, size plus additional, custom class & class_loading

```ruby
bootstrap_submit button_variant: :light, spinner_variant: :dark, class: "custom-submit", class_loading: "custom-submit-loading", size: :lg, text: "Submit!!", loading_text: "Getting submitted"
```

returns

```html
<button type="button" class="btn btn-light btn-lg custom-submit">Submit!!</button>
```

and upon clicking turns into

```html
<button type="button" class="btn btn-light btn-lg custom-submit-loading" disabled="disabled">
    <div role="status" class="spinner-border text-dark spinner-border-sm"
        ><span class="sr-only">Loading...</span>
    </div>
    Getting submitted
</button>
```
